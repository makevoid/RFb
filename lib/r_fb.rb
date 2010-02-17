require 'digest/md5'
require 'net/http'
require 'json'

module RFb
  PATH = "r_fb"
  PATH = File.expand_path("../r_fb", __FILE__)
  require "#{PATH}/exceptions"
  require "#{PATH}/configurable"
  require "#{PATH}/fql"
  require "#{PATH}/methods"
  require "#{PATH}/parser"
  require "#{PATH}/session"
  require "#{PATH}/user"
  
  SERVER = "www.facebook.com"
  API_PATH = "#{SERVER}/restserver.php"
  LOGIN_PATH = "http://#{SERVER}/login.php"
  
  
  
  include Exceptions
  include Methods
  
  class << self
    include Configurable
  end
  
  # def self.api_url=(url)
  #   ENV["rfb_api_url"] = url
  # end

  
  def self.login_url(next_param = "")
      next_param = "&next=#{next_param}" unless next_param.empty?
      "#{LOGIN_PATH}?api_key=#{api_key}&v=1.0#{next_param}"
  end
  
  def self.get_session(auth_token)
    response = request(method: Methods::AUTH_GET_SESSION, auth_token: auth_token)
  end
  
  def self.request(params)
    response = make_request(params)
    if debug
      puts "RESPONSE"
      puts response.body.inspect
    end
    parsed = Parser.parse(response)
  end

  def self.make_request(params)
    params.stringify_keys!
    params['api_key'] = api_key
    params['call_id'] = Time.new.to_f.to_s
    params['v'] = "1.0"
    params['format'] = "json"
    
    secure = false
    api_url = URI.parse("#{(secure ? 'https' : 'http')}://#{API_PATH}")

    # Generate signature and add it to the list of params
    params_str = params.sort.map! { |p| "#{p[0]}=#{p[1]}" }.join
    params['sig'] = Digest::MD5.hexdigest(params_str + ENV["rfb_secret"])

    # Prepare POST request with params
    req = Net::HTTP::Post.new(api_url.path)
    req.set_form_data(params)
    
    # Setup connection and make request. Use SSL if necessary.
    connection = Net::HTTP.new(api_url.host, api_url.port)
    connection.read_timeout = @http_read_timeout
    connection.open_timeout = @http_open_timeout
    if api_url.scheme == 'https'
        connection.use_ssl = true
        connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    puts "calling #{params["method"]}" if debug
    puts "request params: #{params.inspect}" if debug
    request = connection.request(req)
  end
  
end
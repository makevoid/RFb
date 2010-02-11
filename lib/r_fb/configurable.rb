module Configurable
  def environment=(env)
    ENV["rfb_environment"] = env.to_sym
  end
  def environment
    ENV["rfb_environment"]
  end

  def api_key=(key)
    ENV["rfb_api_key"] = key[environment.to_sym]
  end
  def api_key
    ENV["rfb_api_key"]
  end

  def secret_key=(secr)
    ENV["rfb_secret"] = secr[environment.to_sym]
  end
  def secret_key
    ENV["rfb_secret"]
  end

  def app_name=(name)
    ENV["rfb_app_name"] = name
  end
  def app_name
    ENV["rfb_app_name"]
  end

  def debug=(value)
    ENV["rfb_debug"] = value ? "1" : nil
  end
  def debug
    ENV["rfb_debug"]
  end

  def app_url
    raise RFbAppNameUndefined if app_name.nil?
    "http://apps.facebook.com/#{app_name}"
  end
end
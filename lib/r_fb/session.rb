module RFb
  
  class Session
     attr_accessor :params
     def initialize(params={})
       @params = filter_session_params(params)
       @@session_key = params["fb_sig_session_key"]
     end

     def self.session_key
       @@session_key
     end

     def logged_in?
       !@params[:fb_sig_logged_out_facebook]
     end

     def user_has_added_app?
       @params[:fb_sig_added]
     end

     def active?
       !@params[:fb_sig_user].nil?
     end

     def filter_session_params(params)
       to_filter = [:fb_sig_in_iframe, :fb_sig_in_new_facebook, :fb_sig_added, :fb_sig_logged_out_facebook].map(&:to_s)
       params.map do |k, v|
         params[k] = v == true || v.to_i == 1 if to_filter.include? k
       end
       params
     end
   end
  
  
end
module RFb
  class User
  
    FIELDS = [:first_name, :name, :current_location, :has_added_app, :locale, :pic, :profile_url, :status, :timezone, :username]
    EXCLUDED_FIELDS = [:current_location]
    
    attr_accessor :fb_id
    attr_accessor :user
    FIELDS.map do |field|
      attr_accessor field
    end
  
    def initialize(attrs={})
      attrs.map do |attr_name, attr_value|
        instance_variable_set("@#{attr_name}", attr_value)
      end
      @user = attrs[:user]
      @fb_id = attrs[:fb_id]
    end
    
    def self.first(attrs={})
      raise "RFb::User.first called!"
      user = ::User.first(:fb_id => attrs[:fb_id])
      u = User.new(attrs.merge(:user => user))
      u.select_all
    end
  
    def self.find_or_create(attrs={})
      # calls DataMapper model class User
      user = ::User.first(:fb_id => attrs[:fb_id])
      user = ::User.create(:fb_id => attrs[:fb_id]) if user.nil?
      u = User.new(attrs.merge(:user => user)).select_all
    end
  
    def friends
      Fql.query("SELECT #{FIELDS.join(", ")} FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1=#{self.fb_id}) AND has_added_app = 1 ")
    end
  
    def is_app_user?
      has_added_app
    end
  
    def select_all
      fb_uids = self.fb_id.to_i
      raise "Facebook user id is 0/nil for user: #{self.inspect}" if fb_uids == 0
      parsed_response = RFb.request({
                          method: "facebook.Users.getInfo", 
                          uids: [fb_uids].to_s, 
                          fields: FIELDS.map(&:to_s).to_s
                        })
      # puts "parsed response: [uids: #{[self.fb_id.to_i]} ] "
      # puts parsed_response.inspect
      FIELDS.map do |field|
        value = parsed_response[field.to_s]
        instance_variable_set("@#{field}", value)
        user.send("#{field}=",  value) unless EXCLUDED_FIELDS.include?(field)
      end
      #user.update_attributes(name: "Francesco")

      unless user.save
        raise "RFb::User#select_all failed, failed to #user.save, user: #{user.errors.inspect}"
      end
      
      self
    end
  
  
  end
end
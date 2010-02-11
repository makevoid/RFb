module RFb
  module Exceptions
    class RFbAppException < Exception
      def message
        "Ruby Fb internal general error"
      end
    end
    class RFbAppNameUndefined < RFbAppException
      def message
        "AppName not defined! - define it by adding this in your environment: RFb.app_name = 'your_app_name'"
      end
    end
    class RFbEnvUndefined < RFbAppException
      def message
        "Environment not defined! - define it by adding this in your environment: RFb.environment = Rails.env for rails, RFb.environment = ENV['RACK_ENV'] for rack and so on..."
      end
    end
  end
end
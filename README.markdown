# RFb

**RubyFacebook** - interact with Facebook REST API (json) - rails3 enabled

RubyFacebook interacts with Facebook REST API via JSON. No XML to deal with, no parsers needed, reduced verbosity, increased happiness. Ruby1.9 required.

## Installation

  gem install RFb


## Bundling

to bundle RFb, in your Gemfile:
  
  gem 'RFb', :require => 'r_fb'


## Configuration

configurations in yml file soon will come...


### Rails 3

- add RFb to your Gemfile
- install it (bundle install)
- create a new initializer file (say 'facebook.rb') and add some configurations:

config/initializers/facebook.rb :

    require 'r_fb'
    
    RFb.app_name = "your_app_name"
    RFb.environment = Rails.env
    RFb.api_key = { 
      development: "your_facebook_api_key_here",
      test: "",
      production: ""
    }
    RFb.secret_key = { 
      development: "your_facebook_secret_here",
      test: "",
      production: ""
    }
    RFb.debug = true # displays 



and you're done!



## Basic Usage

See the facebook REST API ( http://wiki.developers.facebook.com/index.php/API ) so you can see what methods are available and how to call them. 


*Example:*

To get some user information:
  
    fields = %w(username name first_name has_added_app locale pic profile_url status timezone)
    RFb.request({
      method: "facebook.Users.getInfo", 
      uids: [1218562195].to_s, 
      fields: [fields].to_s
    })
  
result:

    [{"first_name":"Francesco","name":"Francesco Canessa","pic":"http:\/\/profile.ak.fbcdn.net\/v22940\/158\/98\/s1218562195_9493.jpg","status":{"message":"","time":0,"status_id":0},"timezone":1,"uid":1218562195,"has_added_app":true,"locale":"en_US","profile_url":"http:\/\/www.facebook.com\/makevoid","username":"makevoid"}]


a shorter version:

    User.new(fb_id: 1218562195)
  
  

more docs will come when session handling API will be solid enough!
  
  

Look at the source code and see that is pretty simple stuff, so fork it, change it, get inspired and roll your own... simply do whatever you want!
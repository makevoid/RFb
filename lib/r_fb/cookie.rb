module RFb
  class Cookie
    METHODS = {
      get: "Data.getCookie"
      set: "Data.setCookie"
    }
    
    # TODO: remove if unused, implement if needed :)
    
    def get
    
    end
  
    def set
      response = RFb.request({
                    method: METHODS[:set], 
                    name: "test",
                    value: 123
                 })
    end
  end
end
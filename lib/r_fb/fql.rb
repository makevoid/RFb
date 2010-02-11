module RFb
  class Fql
    
    def self.query(string)
      RFb.request({
                    method: "facebook.Fql.query", 
                    query: string,
                    session_key: Session.session_key
                  })
    end
    
  end
end
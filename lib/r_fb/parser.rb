module RFb
  
  class Parser  
    attr_accessor :doc

    def self.parse(response)
      parser = Parser.new(response)

      if parser.doc.is_a?(Hash) && !parser.doc["error_code"].nil?
        raise( { code: parser.doc["error_code"],  message: parser.doc["error_msg"] }.inspect )
      end

      parser.doc.first
    end

    def initialize(response)
      @doc = JSON.parse(response.body)

      case response
      when Net::HTTPSuccess
      else
        raise "Parser - Net::HTTP - not yet handled error: #{@doc.inspect}"
        #raise( { code: error_code,  message: @doc.xpath("//error_msg").text }.inspect )
      end 
    end
    
  end
end
module Api
  module V1
    class ApiError
      attr_accessor :message, :param
      
      def self.missing_parameter(param)
        return self.new(:param => param, :message => "Missing parameter #{param}.")
      end
      
      def self.internal_error(message)
        return self.new(:message => message)
      end
      
      def initialize(options = {})
        self.message = options[:message]
        self.param = options[:param]
      end
      
      def as_json(options)
        { "error" => super(options) } 
      end
    end
  end
end
module Mediasilo
  class Resource
    class Account < Base

      def initialize(session)
        @session = session
        @client = Api::Account.new
      end

      def get_preferences(options = {})
        @result = symbolize_keys(@client.get_preference(request_options(options)).perform.parse{|y| MultiJson.decode(y) } )
        @result[:preferences]
      end

      def set_preferences(options = {})
        @result = symbolize_keys(@client.set_preference(request_options(options)).perform.parse{|y| MultiJson.decode(y) } )
        self.success?
      end

      private
      def request_options(options = {})
        { session: @session.session }.merge(options)
      end

    end

  end
end

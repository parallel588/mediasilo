module Mediasilo
  class Resource
    class Session < Base
      attr_accessor :credentials, :result

      def initialize(credentials)
        @credentials = credentials
      end

      def auth
        @result = symbolize_keys(Api::User.new.login(@credentials).perform.parse{|y| MultiJson.decode(y) })
        self.success?
      end

      def error_description
        "#{code} - #{status}: #{description}"
      end

    end

  end
end

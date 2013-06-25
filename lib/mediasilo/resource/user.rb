module Mediasilo
  class Resource
    class User < Base

      def initialize(session)
        @session = session
        @client = Api::User.new
      end


      private
      def request_options(options = {})
        { session: @session.session }.merge(options)
      end

    end

  end
end

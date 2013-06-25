module Mediasilo

  class Api
    class Base < ::Weary::Client
      include Logging
      extend Logging

      FORMAT =  'json'
      class << self

        def domain(host=nil)
          @domain = host unless host.nil?
          @domain || Mediasilo::ENDPOINT
        end

        def defaults(hash=nil)
          @defaults ||= {}
          @defaults.merge(hash) unless hash.nil?
          @defaults
        end

      end

    end
  end
end

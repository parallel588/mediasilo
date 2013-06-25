module Mediasilo
  class Client
    include Logging
    extend Logging

    attr_accessor :session

    def initialize(options = {})
      @credentials =  {
        apikey: options[:apikey],
        hostname: options[:hostname],
        username: options[:username],
        password: options[:password]
      }
      @session = Resource::Session.new(@credentials)
      raise MediasiloAuthError, @session.error_description unless @session.auth
    end

    def account
      @account ||= Resource::Account.new @session
    end

  end
end

require "mediasilo/api/base"
require "mediasilo/api/user"
require "mediasilo/api/account"

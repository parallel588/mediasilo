require "mediasilo/version"
require 'mono_logger'
require 'weary'

module Mediasilo
  ENDPOINT = "https://api2.mediasilo.com".freeze

  class MediasiloError < StandardError; end
  class MediasiloAuthError < MediasiloError; end

  class << self

    def logger=(any_logger)
      @logger = any_logger
    end

    def logger
      @logger ||= MonoLogger.new(STDOUT)
    end

  end
end

require "mediasilo/logging"
require "mediasilo/client"
require "mediasilo/resource"

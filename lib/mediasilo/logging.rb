module Mediasilo

  module Logging

    def self.log(severity, message)
      Mediasilo.logger.__send__(severity, message) if Mediasilo.logger
    end

    [:debug, :info, :warn, :error, :fatal].each do |level|
      define_method level do |message|
        Logging.log(level, message)
      end
    end

    module_function :debug, :info, :warn, :error, :fatal
  end

end

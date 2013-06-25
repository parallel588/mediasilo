module Mediasilo
  class  Resource
    attr_accessor :result
    class Base

      def success?
        @result[:status].to_s.downcase == 'success'
      end
      def error?
        @result[:status].to_s.downcase == 'error'
      end

      def method_missing(name, *args)

        if @result.has_key?(name.to_s.gsub(/=\Z/,'').to_sym)
          if name.to_s =~ /=\Z/
              @result[name.to_s.gsub(/=\Z/,'').to_sym] = args.first
          end
          @result[name.to_sym]
        else
          super
        end
      end

      def symbolize_keys(arg)
        case arg
        when Array
          arg.map { |elem| symbolize_keys(elem) }
        when Hash
          Hash[
               arg.map { |key, value|
                 k = key.is_a?(String) ? key.downcase.to_sym : key
                 v = symbolize_keys(value)
                 [k,v]
               }]
        else
          arg
        end

      end

    end

  end
end

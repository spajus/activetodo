require 'activetodo/version'

module ActiveTodo

  class Configuration
    class << self
      def warn_only?(options = {})
        return options[:warn_only] if options.keys.include?(:warn_only)
        @@warn_only ||= true
      end

      def warn_only=(condition)
        @@warn_only = condition
      end

      def ignore_production?(options = {})
        return options[:ignore_production] if options.keys.include?(:ignore_production)
        @@ignore_production ||= true
      end

      def ignore_production=(condition)
        @@ignore_production = condition
      end

      def show_callsite?
        @@show_callsite ||= false
      end

      def show_callsite=(condition)
        @@show_callsite = condition
      end
    end
  end

  def self.configure
    yield Configuration if block_given?
  end

  class PrivateMethods
    class << self
      def log_message(message, options)
        if defined?(Rails) && Configuration.ignore_production?(options)
          return if Rails.env.production?
        end
        if defined?(Rails) && Rails.logger
          Rails.logger.warn(message)
        else
          puts message
        end
      end
    end
  end

  module KernelMethods

    def TODO(what, options = {})
      deadline = DateTime.parse(options[:deadline]) if options[:deadline]
      callsite = caller.first if Configuration.show_callsite?

      if deadline && DateTime.now >= deadline
        message = "Deadline reached for \"#{what}\" (#{options[:deadline]})"
        message += " in #{callsite}" if callsite

        if Configuration.warn_only?(options)
          PrivateMethods.log_message(message, options)
        else
          raise message
        end
      end
    end

    alias_method :FIXME, :TODO
    alias_method :XXX,   :TODO

  end
end

include ActiveTodo::KernelMethods

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
    end
  end

  def self.configure
    yield Configuration if block_given?
  end

  class PrivateMethods
    class << self
      def log_message(message)
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

      if deadline && DateTime.now >= deadline
        message = "Deadline reached for \"#{what}\" (#{options[:deadline]})"

        if Configuration.warn_only?(options)
          PrivateMethods.log_message(message)
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

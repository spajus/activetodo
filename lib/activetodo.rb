require 'activetodo/version'

module ActiveTodo

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

        if options[:warn_only]
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

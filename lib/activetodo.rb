require 'activetodo/version'

module ActiveTodo
  module KernelMethods

    def TODO(what, options = {})

    end

    alias_method :FIXME, :TODO
    alias_method :XXX,   :TODO
  end
end

include ActiveTodo::KernelMethods

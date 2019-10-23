# frozen-string-literal: true

class Roda
  # Plugin implementation
  module RodaPlugins
    # The appsignal plugin starts and sets APM instrumentation via Appsignal
    #
    # Example:
    #
    #   plugin :appsignal
    #   plugin :appsignal, sanitize: proc { |action_name| action_name.gsub(/\d+\/, '') }
    #   plugin :appsignal, namespeace: 'custom_namespace'
    #
    module Appsignal
      def self.configure(app, namespeace: 'web', sanitize: proc { |name| name })
        app.opts[:appsignal_sanitize] = sanitize
        app.opts[:appsignal_namespace] = namespeace
        app.use ::Appsignal::Rack::GenericInstrumentation
      end

      # Instance method overrides
      module InstanceMethods
        private

        def _roda_before_10__appsignal
          ::Appsignal.set_namespace(opts[:appsignal_namespace])
          ::Appsignal.set_action(
            opts[:appsignal_sanitize].call(request.inspect.gsub(/#|<|>/, ''))
          )
        end
      end
    end

    register_plugin(:appsignal, Appsignal)
  end
end

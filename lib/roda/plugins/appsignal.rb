# frozen-string-literal: true

class Roda
  module RodaPlugins
    # The appsignal plugin starts and sets APM instrumentation via Appsignal
    #
    # Example:
    #
    #   plugin :appsignal
    #   plugin :appsignal, proc { |action_name| action_name.gsub!(/\d+\/, '') }
    #
    module Appsignal
      def self.configure(app, sanitize = proc { |name| name })
        app.opts[:appsignal_sanitize] = sanitize
        app.use ::Appsignal::Rack::GenericInstrumentation
      end

      module InstanceMethods
        private

        def _roda_before_10__appsignal
          ::Appsignal.set_action(
            opts[:appsignal_sanitize].call(request.inspect.gsub!(/#|<|>/, ''))
          )
        end
      end
    end

    register_plugin(:appsignal, Appsignal)
  end
end

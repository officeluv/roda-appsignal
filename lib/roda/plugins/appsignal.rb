# frozen-string-literal: true

class Roda
  module RodaPlugins
    # The appsignal plugin starts and sets APM instrumentation via Appsignal
    #
    # Example:
    #
    #   plugin :appsignal
    module Appsignal
      def self.configure(app)
        app.use ::Appsignal::Rack::GenericInstrumentation
      end

      module InstanceMethods
        private

        def _roda_before_10__appsignal
          ::Appsignal.set_action(request.inspect.gsub(/#|<|>/, ''))
        end
      end
    end

    register_plugin(:appsignal, Appsignal)
  end
end

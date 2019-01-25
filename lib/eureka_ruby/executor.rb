require 'eureka_ruby/http_client'
require 'net/http'
require 'uri'
require 'json'

module EurekaRuby
  class Executor
    include HttpClient

    def run(action_type)
      raise 'Unknow message type' unless [:send_heartbeat, :register, :deregister].include?(action_type)
      case action_type
      when :send_heartbeat
        send_heartbeat
      when :register
        register_application_instance
      when :deregister
        deregister_application_instance
      end
    end

    private
      def send_heartbeat
        put EurekaRuby.configuration.instance_url
      end

      def register_application_instance
        post(
          EurekaRuby.configuration.application_url,
          EurekaRuby.configuration.register_payload
        )
      end

      def deregister_application_instance
        delete EurekaRuby.configuration.instance_url
      end
  end
end
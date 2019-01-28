require 'eureka_ruby/http_client'

module EurekaRuby
  class Executor
    attr_reader :client

    def initialize
      api_base = EurekaRuby.configuration.eureka_url
      timeout = 30
      skip_verify_ssl = EurekaRuby.configuration.scheme == 'http'
      @client = HttpClient.new(api_base, timeout, skip_verify_ssl)
    end

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
        client.put EurekaRuby.configuration.instance_path
      end

      def register_application_instance
        client.post EurekaRuby.configuration.application_path, EurekaRuby.configuration.register_payload
      end

      def deregister_application_instance
        client.delete EurekaRuby.configuration.instance_path
      end
  end
end
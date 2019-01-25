require 'eureka_ruby/http_client'
require 'net/http'
require 'uri'

module EurekaRuby
  class Executor
    include HttpClient

    def run(action_type)
      raise 'Unknow message type' unless [:keep_living].include?(action_type)
      case action_type
      when :keep_living
        keep_living
      end
    end

    private
      def keep_living
        put(keep_living_url)
      end

      def keep_living_url
        EurekaRuby.configuration.eureka_url +
          'apps/' + EurekaRuby.configuration.app_id + '/' + EurekaRuby.configuration.instance_id
      end
  end
end
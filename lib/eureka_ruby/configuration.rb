# https://www.skcript.com/svr/the-easiest-configuration-block-for-your-ruby-gems/
# https://github.com/shideneyu/kraken_client
# https://www.reddit.com/r/ruby/comments/54fgia/whats_the_best_configuration_pattern_when/
# https://robots.thoughtbot.com/mygem-configure-block
# https://github.com/thoughtbot/clearance/blob/master/lib/clearance/configuration.rb
module EurekaRuby
  class Configuration
    %i(eureka_url app_id host_name ip_addr port scheme).each { |attr| attr_accessor attr }

    def initialize
      @port = 3000
    end

    def instance_id
      "#{host_name}:#{ip_addr}:#{port}"
    end

    def instance_url
      EurekaRuby.configuration.eureka_url +
        'apps/' + EurekaRuby.configuration.app_id + '/' + EurekaRuby.configuration.instance_id
    end

    def application_url
      EurekaRuby.configuration.eureka_url +
        'apps/' + EurekaRuby.configuration.app_id
    end

    def register_payload
      {
        instance: {
          instanceId: instance_id,
          hostName: host_name,
          app: app_id,
          ipAddr: ip_addr,
          status: "UP",
          vipAddress: "com.automationrhapsody.eureka.app",
          secureVipAddress: "com.automationrhapsody.eureka.app",
          port: { "$": port, "@enabled": "true" },
          securePort: { "$": "8443", "@enabled": "false" },
          healthCheckUrl: "#{scheme}://#{ip_addr}:#{port}/health",
          statusPageUrl: "#{scheme}://#{ip_addr}:#{port}/info",
          homePageUrl: "#{scheme}://#{ip_addr}:#{port}/",
          dataCenterInfo: {
            "@class": "com.netflix.appinfo.InstanceInfo$DefaultDataCenterInfo",
            name: "MyOwn"
          }
        }
      }
    end
  end

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield configuration
    end
  end
end
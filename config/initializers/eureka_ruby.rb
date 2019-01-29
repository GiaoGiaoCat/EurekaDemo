EurekaRuby.configure do |config|
    config.eureka_url      = 'http://192.168.74.182:8701/eureka/'
    config.app_id          = 'VICTOR-RUBY'
    config.host_name       = '192.168.74.46'
    config.ip_addr         = '192.168.74.46'
    config.port            = '3000' # option
    config.scheme          = 'http'
    config.health_path     = 'health' # option
    config.health_response = 'OK' # option
    config.health_headers  = { "Content-Type" => "text/plain" } # option
    config.info_path       = 'info' # option
    config.info_response   = { "author" => "Victor", "language" => "Ruby" }
end

# Register Instance
EurekaRuby.executor.run(:register)

# Keep Living
Thread.new do
  loop do
    EurekaRuby.executor.run(:send_heartbeat)
    sleep 30
  end
end
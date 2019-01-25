EurekaRuby.configure do |config|
  config.eureka_url = 'http://192.168.74.182:8701/eureka/'
  config.app_id = 'DEMO-RUBY'
  config.host_name = '192.168.74.46'
  config.ip_addr = '192.168.74.46'
  # config.port = '3000'
  config.scheme = 'http'
  # config.health_path = 'health'
  # config.health_response = 'OK'
  # config.health_headers = '{"Content-Type" => "text/plain"}'
  # config.info_path = 'info'
  config.info_response = '{ "author" => "Victor", "language" => "Ruby" }'
end

# Keep Living
# Thread.new do
#   loop do
#     executor = EurekaRuby.executor
#     executor.run(:send_heartbeat)
#     sleep 30
#   end
# end

# Register Instance
# EurekaRuby.executor.run(:register)
# NOTE:
# https://github.com/Netflix/batch_request_api/blob/master/lib/batch_request_api/railtie.rb
module EurekaRuby
  class Railtie < Rails::Railtie
    config.app_middleware.insert 0, EurekaRuby::Middleware::Health
    config.app_middleware.insert 0, EurekaRuby::Middleware::Info
  end
end
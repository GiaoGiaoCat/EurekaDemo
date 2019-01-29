module EurekaRuby
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == "/#{health_path}"
        NewRelic::Agent.ignore_transaction if defined? NewRelic
        [200, health_headers, [health_response]]
      elsif env['PATH_INFO'] == "/#{info_path}"
        NewRelic::Agent.ignore_transaction if defined? NewRelic
        [200, { 'Content-Type' => 'application/json' }, [info_response.to_json]]
      else
        @app.call(env)
      end
    end

    %w(health_path health_response health_headers info_path info_response).each do |name|
      define_method(name) { EurekaRuby.configuration.send(name) }
    end
  end
end
module EurekaRuby
  class Health
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == "/#{health_path}"
        NewRelic::Agent.ignore_transaction if defined? NewRelic
        [200, health_headers, [health_response]]
      else
        @app.call(env)
      end
    end

    %w(health_path health_response health_headers).each do |name|
      define_method(name) { EurekaRuby.configuration.send(name) }
    end
  end
end
module EurekaRuby
  class Info
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == "/#{info_path}"
        NewRelic::Agent.ignore_transaction if defined? NewRelic
        [200, { 'Content-Type' => 'application/json' }, [info_response]]
      else
        @app.call(env)
      end
    end

    %w(info_path info_response).each do |name|
      define_method(name) { EurekaRuby.configuration.send(name) }
    end
  end
end
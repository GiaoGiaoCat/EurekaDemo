require 'http'

module EurekaRuby
  class HttpClient
    attr_reader :base, :ssl_context, :httprb

    def initialize(base, timeout, skip_verify_ssl)
      @base = base
      @httprb = HTTP.timeout(write: timeout, connect: timeout, read: timeout)
      @ssl_context = OpenSSL::SSL::SSLContext.new
      @ssl_context.ssl_version = :TLSv1
      @ssl_context.verify_mode = OpenSSL::SSL::VERIFY_NONE if skip_verify_ssl
    end

    def get(path)
      request(path) { |url| httprb.get(url, ssl_context: ssl_context) }
    end

    def post(path, payload = {})
      request(path) { |url| httprb.post(url, json: payload, ssl_context: ssl_context) }
    end

    def put(path, payload = {})
      request(path) { |url| httprb.put(url, json: payload, ssl_context: ssl_context) }
    end

    def delete(path)
      request(path) { |url| httprb.delete(url, ssl_context: ssl_context) }
    end

    private

    def request(path)
      yield("#{base}#{path}")
    end
  end
end
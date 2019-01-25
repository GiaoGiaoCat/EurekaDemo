module EurekaRuby
  module HttpClient

    private

    def put(url, payload = {})
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Put.new(uri.path)
      response = http.request(request) # the actual PUT request
    end

    def get(url)
      uri = URI.parse(url)
      response = Net::HTTP.get(uri)
    end

    def post(url, payload = {})
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
      request.body = payload.to_json
      response = http.request(request)
    end

    def delete(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Delete.new(uri.path)
      response = http.request(request)
    end
  end
end
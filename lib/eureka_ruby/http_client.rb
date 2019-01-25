module EurekaRuby
  module HttpClient

    private

    def put(url, params)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Put.new(uri.path)
      http.request(request) # the actual PUT request
    end

    def get(url)
      uri = URI.parse(url)
      Net::HTTP.get(uri)
    end

    def post(url, params)
      uri = URI.parse(url)
      Net::HTTP.post_form(uri, params)
    end

    def delete(url)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Delete.new(uri.path)
      http.request(request)
    end
  end
end
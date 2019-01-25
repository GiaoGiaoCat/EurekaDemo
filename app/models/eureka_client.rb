require 'net/http'
require 'uri'

class EurekaClient
  def self.keep_living
    url = 'http://192.168.74.154:8701/eureka/apps/DEMO-RUBY/demo-ruby:192.168.74.4:3000'
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Put.new(uri.path)
    http.request(request) # the actual PUT request
  end
end
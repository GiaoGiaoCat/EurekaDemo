Thread.new do
  loop do
    EurekaClient.keep_living
    sleep 30
  end
end
Thread.new do
  loop do
    executor = EurekaRuby.executor
    executor.run(:keep_living)
    sleep 30
  end
end
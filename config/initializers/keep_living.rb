Thread.new do
  loop do
    executor = EurekaRuby.executor
    executor.run(:send_heartbeat)
    sleep 30
  end
end
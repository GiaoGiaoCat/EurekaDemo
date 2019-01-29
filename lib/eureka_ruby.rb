require 'forwardable'
require 'eureka_ruby/railtie' if defined?(Rails)
require 'eureka_ruby/middleware/health'
require 'eureka_ruby/middleware/info'
require 'eureka_ruby/configuration'
require 'eureka_ruby/executor'

module EurekaRuby
  class << self
    extend Forwardable

    attr_reader :executor

    def_delegators :executor, :run

    def executor
      @executor = Executor.new
    end
  end
end
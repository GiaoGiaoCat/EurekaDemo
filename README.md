# README

## 1月26日更新

* 使用 middleware 实现了 health 和 info
* 注册和心跳都挪到了 `config/initializers/eureka_ruby.rb`
* `config/initializers/eureka_ruby.rb` 被注释掉的配置项均有默认值

## 1月25日

把 Rails 项目注册到 eureka 中。

* 核心代码在 `lib/eureka_ruby` 文件夹中。
* 心跳 `config/initializers/keep_living.rb`
* 注册 `config/initializers/register_application_instance.rb`
* 配置项 `config/initializers/eureka_ruby.rb`


例子

```ruby
EurekaRuby.executor.run(:register)
EurekaRuby.executor.run(:deregister)
EurekaRuby.executor.run(:send_heartbeat)
```

## 已经实现

* Register new application instance
* De-register application instance
* Send application instance heartbeat

## BUG

在 `config/initializers/rack_heartbeat.rb` 中以 thread 的方式保持心跳，启用 `rails console` 会为心跳打开单独的进程和另外一个莫名奇妙的进程，并且退出 console 的时候，这两个进程不会被关闭。

**执行 `rails server` 的时候并不会出现这个问题。**

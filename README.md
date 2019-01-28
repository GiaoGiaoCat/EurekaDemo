# README

## 咋用

1. git clone 代码
2. bundle 安装 gem
3. rails s 启动服务

## 1月28日更新

* 使用 `http` gem 代替 Ruby build-in 的 `NET::HTTP` 库
* 支持 https

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

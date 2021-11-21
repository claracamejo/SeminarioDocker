require 'sinatra'
require 'sinatra/reloader'
require 'redis'

configure :development do
  register Sinatra::Reloader
end

before do
  @redis = Redis.new(host: "redis", port: 6379, db: 15)
end

get '/' do
    "Cuenta: #{@redis.get("counter")}"
end

get '/incrementar' do
    "Cuenta incrementado: #{@redis.incr("counter")}"
end

get '/decrementar' do
  "Cuenta decrementado: #{@redis.decr("counter")}"
end
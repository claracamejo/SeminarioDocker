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
    "Contador: #{@redis.get("counter")}"
end

get '/incrementar' do
    "Contador incrementado: #{@redis.incr("counter")}"
end

get '/decrementar' do
  "Contador decrementado: #{@redis.decr("counter")}"
end
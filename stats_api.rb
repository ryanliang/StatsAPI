require 'sinatra'
require 'json'
require 'sequel'
require 'pp'

DB = Sequel.connect("sqlite://#{Dir.pwd}/db/dev.db")

get '/' do
  'Hello world!'
  @title = 'ryan liang'
  erb :index
end

get '/stats/:date' do
  params[:date]
end

post '/stats' do
  raw = JSON.parse(request.env["rack.input"].read)
  # request.env["rack.input"].read
  @post_data = raw
  pp @post_data
  'successful'
end

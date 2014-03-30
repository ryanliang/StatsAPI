require 'sinatra'
require 'json'
require 'sequel'
require 'pp'

DB = Sequel.connect("sqlite://#{Dir.pwd}/db/dev.db")

require_relative './models/execution'
require_relative './models/area'
require_relative './helpers/stats_processor'

get '/' do
  @executions = Execution.all
  erb :index
end

get '/stats/:date' do
  params[:date]
end

post '/stats' do
  @post_data = JSON.parse(request.env["rack.input"].read)
  StatsProcessor.create(@post_data)
end

require 'sinatra'
require 'json'
require 'sequel'
require 'pp'

DB = Sequel.connect("sqlite://#{Dir.pwd}/db/dev.db")

require_relative './models/execution'
require_relative './models/area'

get '/' do
  'Hello world!'
  @title = 'ryan liang'
  erb :index
end

get '/stats/:date' do
  params[:date]
end

post '/stats' do
  @post_data = JSON.parse(request.env["rack.input"].read)

  name, size = @post_data['area'], @post_data['size']
  area = Area.first(name: name, size: size)

  if area.nil?
    Area.new do |a|
      a.name = name
      a.size = size
      a.save
    end
    area = Area.first(name: name, size: size)
  end

  Execution.new do |e|
    e.area_id = area.area_id
    e.year = @post_data['year']
    e.release = @post_data['release']
    e.raw_stats = @post_data['raw_stats']
    e.tc_agent = @post_data['tc_agent']
    e.env = @post_data['env']
    e.install = @post_data['install']
    e.os = @post_data['os']
    e.browser = @post_data['browser']
    e.major_version = @post_data['major_version']
    e.minor_version = @post_data['minor_version']
    e.save
  end
  'successful'
end

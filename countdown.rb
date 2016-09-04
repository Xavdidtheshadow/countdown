require 'sinatra'
require 'tilt/haml'
require 'tilt/sass'

configure do
  require './things'
  set :things, @things
  #firstnightbestnight is April 5
  set :wc, Date.new(2017, 4, 5)
  # this doesn't get used anywhere, but this is the last time I updated any of the values
  set :updated, Date.new(2016, 9, 4)
end

helpers do
  def fetch_item
    settings.things.sample
  end
end

get '/' do
  @days_until = (settings.wc - Date.today).to_f
  @done = @days_until < 0
  @item = fetch_item
  haml :index
end

get '/last_updated' do
  settings.updated.to_s
end

get '/item' do
  fetch_item.to_json
end

get '/the.css' do
  scss :the
end

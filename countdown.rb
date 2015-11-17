require 'sinatra'
require 'haml'
require 'sass'

configure do
  require_relative 'things'
  set :things, @things
end

helpers do
  def fetch_item
    settings.things.sample
  end
end

get '/' do
  wc = Date.parse('2016-4-13')
  @days_until = (wc - Date.today).to_f
  puts settings.things
  @item = fetch_item
  haml :index
end

get '/item' do
  fetch_item.to_json
end

get '/the.css' do
  scss :the
end
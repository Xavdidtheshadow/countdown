require 'sinatra'
require 'haml'
require 'sass'

configure do
  require_relative 'things'
  set :things, @things
end

get '/' do
  wc = Date.parse('2016-4-13')
  @days_until = (wc - Date.today).to_f
  puts settings.things
  @item = settings.things.sample
  haml :index
end

get '/the.css' do
  scss :the
end
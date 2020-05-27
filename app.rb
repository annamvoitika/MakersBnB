require 'sinatra'
require './lib/bnb'
require './lib/db_connection'

class MakersBnB < Sinatra::Base
  enable :sessions
  get '/test' do
    "Hello world"
  end


  get '/' do
    erb :index
  end

  post '/new' do
  session['username'] = params['username']
    redirect '/all'
  end

  get '/all' do
    @username = session['username']
    @places = Bnb.all
    erb :all
  end

  get '/add_place' do
    erb :add_place
  end

  post '/add_place_post' do
    Bnb.create(place: params[:place], description: params[:description], fixed_price: params[:fixed_price])
    redirect '/all'
  end

  run! if app_file == $0
end

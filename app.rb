require 'sinatra'
require 'bnb'

class MakersBnB < Sinatra::Base
  get '/test' do
    "Hello world"
  end


  get '/' do
    erb :index
  end

  post '/' do
    username = params['username']
    Username.create(username: username)
    redirect '/'

  get '/all' do
    @places = Bnb.all
    erb :all
  end

  run! if app_file == $0
end

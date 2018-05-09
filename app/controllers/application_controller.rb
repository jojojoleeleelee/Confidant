require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "confidant_secret"
  end

  get '/' do
    erb :index
  end

#   helpers do
#   end
end

class UsersController < ApplicationController
  get '/signup' do
    if logged_in?
      redirect "/emotions"
    else
      erb :"users/create_user"
    end
  end

  post '/signup' do
    if !params[:name].empty? && !params[:email].empty? && !params[:password].empty?
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect "/emotions"
    else
      redirect "/signup"
    end
  end

  get '/login' do
    if logged_in?
      redirect "/emotions"
    else
      erb :"users/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/"
    end
  end

  post '/login' do
    @user = User.find_by(name: params[:username])
    if !@user.nil? && @user.authenticate(params[:password])

      session[:user_id] = @user.id
      redirect "/emotions"
    else
      redirect "/"
    end
  end

  get '/:user_slug' do
    @user = User.find_by_slug(params[:user_slug])
    erb :"/users/show"
  end
end

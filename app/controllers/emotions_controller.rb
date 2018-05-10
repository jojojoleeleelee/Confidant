class EmotionsController < ApplicationController
  get "/emotions" do
    if logged_in?
      @emotions = Emotion.all
      erb :"/emotions/emotions"
    else
      redirect "/login"
    end
  end

  get '/emotions/new' do
    if logged_in?
      erb :"/emotions/create_emotion"
    else
      redirect "/login"
    end
  end

  post '/emotions' do
    if !params[:content].empty?
      @emotion = Emotion.create(params)
      @emotion.user = current_user
      @emotion.user = User.find_by_id(session[:user_id])
      @emotion.save
      redirect "/emotions/#{@emotion.id}"
    else
      redirect '/emotions/new'
    end
  end


  get "/emotions/:id" do
    if logged_in?
      @emotion = Emotion.find_by_id(params[:id])
      erb :"/emotions/show_emotions"
    else
      redirect "/login"
    end
  end


  get "/emotions/:id/edit" do
    if logged_in?
      @emotion = Emotion.find_by(params[:id])
      erb :"/emotions/edit_emotions"
    else
      redirect "/login"
    end
  end

  patch '/emotions/:id' do
    @user = current_user
    @emotion = Emotion.find_by(params[:id])
    if logged_in? && users_emotion? && !params[:content].empty?
      @emotion.update(content: params[:content])
      redirect "/emotions/#{@emotion.id}"
    else
      redirect "/emotions/#{@emotion.id}/edit"
    end
  end

  delete '/emotions/:id/delete' do
    @emotion = Emotion.find_by(params[:id])
    @emotion.delete
    redirect '/emotions'
  end

  get '/emotions/:id' do
    @emotion = Emotion.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
    erb :"/emotions/show_emotions"
  end
end

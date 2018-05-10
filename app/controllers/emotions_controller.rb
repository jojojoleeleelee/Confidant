class EmotionsController < ApplicationController

  get "/emotions" do
    @user = current_user
    if logged_in?
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
    if !params[:name].empty? && !scrape_verses(params[:name]).empty?
      @emotion = Emotion.find_or_create_by(name: params[:name].downcase)
      @emotion.content = params[:content]
      @emotion.user_id = session[:user_id]
      @emotion.verse = scrape_verses(params[:name]).join(" *** ")
      @emotion.save
      redirect "/emotions/#{@emotion.slug}"
    else
      # add flash message that says 'Sorry! For some reason, Confidant can't process that emotion!'
      redirect '/emotions/new'
    end
  end

  post '/emotion/search' do
    
  end

  get '/emotions/:slug' do
    if logged_in?
      @emotion = Emotion.find_by_slug(params[:slug])
      erb :"/emotions/choose_verses"
    else
      redirect "/login"
    end
  end

  post '/emotions/:slug' do
    @emotion = Emotion.find_by_slug(params[:slug])
    @emotion.verse = params[:verse].join(" *** ")
    @emotion.save
    erb :"/emotions/show_emotion"
  end

  get "/emotions/:slug/edit" do
    if logged_in?
      @emotion = Emotion.find_by(params[:id])
      erb :"/emotions/edit_emotions"
    else
      redirect "/login"
    end
  end

  patch '/emotions/:slug' do
    @user = current_user
    @emotion = Emotion.find_by(params[:id])
    if logged_in? && users_emotion? && !params[:content].empty?
      @emotion.update(content: params[:content])
      redirect "/emotions/#{@emotion.id}"
    else
      redirect "/emotions/#{@emotion.id}/edit"
    end
  end

  delete '/emotions/:slug/delete' do
    @emotion = Emotion.find_by(params[:id])
    @emotion.delete
    redirect '/emotions'
  end

  get '/emotions/:slug' do
    @emotion = Emotion.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
    erb :"/emotions/show_emotions"
  end
end

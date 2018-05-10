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
      flash[:message] = "Thanks for sharing."
      redirect "/emotions/#{@emotion.slug}"
    else
      flash[:message] = "Sorry, I don't understand!"
      redirect '/emotions/new'
    end
  end

  post '/emotion/search' do
    @emotion = Emotion.find_by_slug(params[:slug])
    if !@emotion.nil?
      redirect "/emotions/#{@emotion.slug}"
    else
      erb :"/emotions/invalid_search"
    end
  end

  get '/emotions/:emotion_slug' do
    if logged_in?
      @emotion = Emotion.find_by_slug(params[:emotion_slug])
      flash[:message] = "I know, right?!"
      erb :"/emotions/choose_verses"
    else
      redirect "/login"
    end
  end

  post '/emotions/:emotion_slug' do
    @emotion = Emotion.find_by_slug(params[:emotion_slug])
    @emotion.verse = params[:verse].join(" *** ")
    @emotion.save
    flash[:message] = "Yup, I understand!"
    erb :"/emotions/show_emotion"
  end

  get "/emotions/:emotion_slug/edit" do
    if logged_in?
      @emotion = Emotion.find_by_slug(params[:emotion_slug])
      erb :"/emotions/edit_emotion"
    else
      redirect "/login"
    end
  end

  patch '/emotions/:emotion_slug' do
    @user = current_user
    @emotion = Emotion.find_by_slug(params[:emotion_slug])
    if logged_in? && users_emotion? && !params[:name].empty? && !params[:content].empty? && !params[:verse].empty?
      @emotion.update(name: params[:name])
      @emotion.update(content: params[:content])
      @emotion.update(verse: params[:verse].join(" *** "))
      flash[:message] = "We got that fixed!"
      erb :"/emotions/show_emotion"
    else
      # message - you must make the edits you promised to make! Rack flash
      redirect "/emotions/#{@emotion.id}/edit"
    end
  end

  get "/emotions/:emotion_slug/delete" do
    @emotion = Emotion.find_by_slug(params[:emotion_slug])
    if logged_in? && !@emotion.nil?
      @emotion.delete
      flash[:message] = "It's gone forever!"
      redirect "/emotions"
    else
      erb :"/emotions/invalid_search"
    end
  end
end

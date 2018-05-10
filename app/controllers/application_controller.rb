require './config/environment'
require 'open-uri'
require 'nokogiri'

class ApplicationController < Sinatra::Base
  @verses = []

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "confidant_secret"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def users_emotion?
      current_user.id == session[:user_id]
    end

    def scrape_verses(emotion)
      doc = Nokogiri::HTML(open("https://www.biblegateway.com/quicksearch/?quicksearch=#{emotion.downcase.strip}&qs_version=NIV"))

      @verses = doc.css('div.bible-item-text').map do |v| v.text.gsub("\n",'').chomp("In Context | Full Chapter | Other Translations ")
      end
      @verses
    end
  end
end

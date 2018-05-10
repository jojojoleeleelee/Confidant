require 'spec_helper'

describe ApplicationController do

  describe "Homepage" do
    it 'loads the homepage' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Confidant")
    end
  end

  describe "Signup Page" do

    it 'loads the signup page' do
      get '/signup'
      expect(last_response.status).to eq(200)
    end

    it 'signup directs user to Confidant index' do
      params = {
        username: "Dan",
        email: "dan@gmail.com",
        password: "Godisgood"
      }
      post '/signup', params
      expect(last_response.location).to include("/emotions")
    end
  end

  describe 'BibleScraper' do

    describe "#scrape_verse_page" do
      it "can scrape verses based on emotion" do
        @emotion = "Sorrow"
        answer = 'My soul is overwhelmed with sorrow to the point of death,” he said to them. “Stay here and keep watch.'
        scraped_verse = scrape_verses(@emotion)
        expect(scraped_verse).to be_a(Array)
        expect(scraped_verse.last).to match(answer)
      end
    end
  end
end

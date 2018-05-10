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
end

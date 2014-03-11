require 'spec_helper'

def app
  ApplicationApi
end

describe ChallengeApi do
  include Rack::Test::Methods

  describe 'POST /checkin' do
    before(:each) do
      User.create(:name => "Tester 1")
      Business.create(:name => "McTesterton's")
    end

    it 'creates a checking record' do
      data={'user_id' => 1, 'business_id' => 1, 'checkin_date' => '2012-12-25'}
      post '/checkin', data, 'Password' => 'password', 'Content-Type' => 'application/json'
      response_data = JSON.parse(last_response.body) 
      expect(last_response.status).to eq(201)
      expect(response_data).to eq(data.merge({'id' => 1}))
    end
  end

  describe 'GET /checkin' do
    it 'returns a hello world message' do
      get '/checkin'
      expect(last_response).to be_ok
    end
  end

end

require 'rails_helper'

describe 'the favorites creation endpoint' do
  before(:each) do
    @user = User.create!(email: 'whatever@example.com', password: "password")
    @location = "Denver, CO"
  end

  it 'accepts favorite location request', :type => :request do
    user_attempt = {location: @location, api_key: @user.api_key}
    url =  "/api/v1/favorites"

    post url, params: user_attempt

    expect(response).to have_http_status(200)
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:data][:attributes][:favorites]).to be_a(Array)
    expect(result[:data][:attributes][:favorites][0][:location]).to eq(@location)

  end

  it 'rejects favorite request if bad API key' do
    user_attempt = "?location=#{@location}&api_key=1a2b3c4d5e6f"

    post "/api/v1/favorites#{user_attempt}"

    expect(response).to have_http_status(401)
    result = (response.body)
    expect(result).to be_a(String)

  end

end

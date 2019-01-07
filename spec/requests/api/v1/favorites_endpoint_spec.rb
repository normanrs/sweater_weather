require 'rails_helper'

describe 'the favorites endpoint' do
  before(:each) do
    @user = User.create!(email: 'whatever@example.com', password: "password")
    @fav1 = Favorite.create!(user_id: @user.id, location: "Denver, CO")
    @fav2 = Favorite.create!(user_id: @user.id, location: "Austin, TX")
  end

  it 'returns content json from objects' do
    # VCR.use_cassette('favorites_endpoint_spec', :record => :new_episodes) do
    # VCR.use_cassette("favorites_endpoint_spec") do

      get "/api/v1/favorites?api_key=#{@user.api_key}"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data].count).to eq(2)
      expect(result[:data][0][:attributes][:location]).to eq(@fav1.location)
      expect(result[:data][1][:attributes][:location]).to eq(@fav2.location)
      expect(result[:data][0][:attributes][:current_weather].keys.include?(:summary)).to be(true)
      expect(result[:data][0][:attributes][:current_weather].keys.include?(:chance_of_precipitation)).to be(true)
      expect(result[:data][0][:attributes][:current_weather].keys.include?(:temperature_high)).to be(true)
      expect(result[:data][0][:attributes][:current_weather].keys.include?(:temperature_low)).to be(true)
      expect(result[:data][0][:attributes][:current_weather].keys.include?(:gif_url)).to be(true)

    # end
  end

end

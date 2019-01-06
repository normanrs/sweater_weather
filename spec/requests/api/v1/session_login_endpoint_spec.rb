require 'rails_helper'

describe 'the session login creation endpoint' do
  before(:each) do
    @user = User.create!(email: 'whatever@example.com', password: "password")
  end

  it 'returns the users API key' do
    user_attempt = '?email=whatever@example.com&password=password'

    post "/api/v1/sessions#{user_attempt}"

    expect(response).to have_http_status(201)
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:data][:attributes][:api_key]).to be_a(String)

  end

  it 'does not return an API key for a bad call' do
    user_attempt = '?email=whatever@example.com&password=oops'

    post "/api/v1/sessions#{user_attempt}"

    expect(response).to have_http_status(422)
    result = (response.body)
    expect(result).to be_a(String)

  end

end

require 'rails_helper'

describe 'the account creation endpoint' do
  it 'returns the users API key' do
    user_attempt = '?email=whatever@example.com&password=password&password_confirmation=password'

    post "/api/v1/users#{user_attempt}"

    expect(response).to have_http_status(201)
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:data][:attributes][:api_key]).to be_a(String)

  end

  it 'does not return an API key for a bad call' do
    user_attempt = '?email=whatever@example.com&password=password&password_confirmation=oops'

    post "/api/v1/users#{user_attempt}"

    expect(response).to have_http_status(422)
    result = (response.body)
    expect(result).to be_a(String)

  end

  # it 'returns an error for duplicate' do
  #   user = User.create!(email: 'whatever@example', password: "password")
  #   user_attempt = '?email=whatever@example.com&password=password&password_confirmation=password'
  #
  #   post "/api/v1/users#{user_attempt}"
  #   expect(response).to have_http_status(422)
  #   result = (response.body)
  #   expect(result).to be_a(String)
  #
  # end

end

require 'rails_helper'

describe 'the account creation endpoint' do
  it 'returns the users API key' do
    VCR.use_cassette("account_creation_endpoint_spec") do
      user_attempt = '?email=whatever@example.com&password=password&password_confirmation=password'

      post "/api/v1/users#{user_attempt}"

    end
  end
end

# POST /api/v1/users
# Content-Type: application/json
# Accept: application/json
#
# {
#   "email": "whatever@example.com",
#   "password": "password"
#   "password_confirmation": "password"
# }

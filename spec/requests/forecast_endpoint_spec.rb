require 'rails_helper'

describe 'the forecast endpoint' do
  it 'returns content json from objects' do
    get "/api/v1/forecast?location=denver,co"

    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry



  end

end

# GET /api/v1/forecast?location=denver,co
# Content-Type: application/json
# Accept: application/json

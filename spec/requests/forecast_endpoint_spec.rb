require 'rails_helper'

describe 'the forecast endpoint' do
  it 'returns content json from objects' do
    get "/api/v1/forecast?location=denver,co"

    

  end

end

# GET /api/v1/forecast?location=denver,co
# Content-Type: application/json
# Accept: application/json

require 'rails_helper'

RSpec.describe Daily, type: :model do
  it 'exists' do
    hash_in = {:day_of_week=>1546844400,
               :summary=>"Partly cloudy starting in the evening.",
               :chance_of_precipitation=>0.01,
               :temperature_high=>51.21,
               :temperature_low=>27.08,
               :gif_url=>"https://giphy.com/gifs/pretty-sky-gorgeous-alEGxmahCCywE"}

    daily = Daily.new(hash_in)

    expect(daily).to be_a(Daily)

  end
end

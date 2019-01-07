class Favorite < ApplicationRecord
  belongs_to :user

  def current_weather
    location = BingService.new(self.location)
    coordinates = location.coords
    sky = DarkskyService.new(coordinates)
    data = sky.get_forecast
    today = data[:daily][:data][0]
    Daily.new(today)
  end

end

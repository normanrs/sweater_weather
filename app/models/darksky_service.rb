class DarkskyService

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def get_forecast
    latitude = @coordinates[0]
    longitutde = @coordinates[1]
    get_forecast_json(latitude, longitutde)
  end

  def get_forecast_json(latitude, longitutde)
    @response ||= Faraday.get("https://api.darksky.net/forecast/#{ENV["darksky_key"]}/#{latitude},#{longitutde}")
    @parsed ||= JSON.parse(@response.body, symbolize_names: true)
  end

end

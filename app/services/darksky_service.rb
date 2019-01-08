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
    @base_url = "https://api.darksky.net"
    extension = "/forecast/#{ENV["darksky_key"]}/#{latitude},#{longitutde}"
    response  = faraday_conn.get(extension)
    @parsed ||= JSON.parse(response.body, symbolize_names: true)
  end

private

  def faraday_conn
    Faraday.new(url: @base_url)
  end

end

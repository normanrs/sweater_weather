class Forecast

  def initialize(city_state)
    data           = get_data(city_state)
    @summary       = data[:summary]
    @avg_temp      = data[:summary]
    @high_temp     = data[:summary]
    @low_temp      = data[:summary]
    @date_and_time = data[:summary]
    @city_state    = city_state
    @country       = data[:summary]
    @lat           = data[:summary]
    @lon           = data[:summary]
    @today         = data[:summary]
    @tonight       = data[:summary]
    @feels_like    = data[:summary]
    @humidity      = data[:summary]
    @visibility    = data[:summary]
    @uv_index      = data[:summary]
    @hourlies      = []
    @dailies       = []
  end

  def get_data(address)
    location = BingService.new(address)
    coordinates = location.coords
    sky = DarkskyService.new(coordinates)
    sky.get_forecast
  end

end

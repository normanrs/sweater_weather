class Forecast

  attr_reader :id,
              :summary,
              :current_temp,
              :high_temp,
              :low_temp,
              :date_and_time,
              :city_state,
              :timezone,
              :latitude,
              :longitude,
              :hourly_summary,
              :daily_summary,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :gif_url,
              :hourlies,
              :dailies

  def initialize(city_state)
    data            = get_data(city_state)
    @city_state     = city_state
    @id             = data[:currently][:time]
    @summary        = data[:currently][:summary]
    @current_temp   = data[:currently][:temperature]
    @high_temp      = data[:daily][:data][0][:temperatureHigh]
    @low_temp       = data[:daily][:data][0][:temperatureLow]
    @date_and_time  = Time.at(data[:currently][:time])
    @timezone       = data[:timezone]
    @latitude       = data[:latitude]
    @longitude      = data[:longitude]
    @hourly_summary = data[:hourly][:summary]
    @daily_summary  = data[:minutely][:summary]
    @feels_like     = data[:currently][:apparentTemperature]
    @humidity       = data[:currently][:humidity]
    @visibility     = data[:currently][:visibility]
    @uv_index       = data[:currently][:uvIndex]
    @gif_url        = get_gif(data[:minutely][:summary])
    @hourlies       = get_hourlies(data)
    @dailies        = get_dailies(data)

  end

  def get_hourlies(data)
    data[:hourly][:data][1..8].map do |hour|
      Hourly.new(hour)
    end
  end

  def get_dailies(data)
    data[:daily][:data][1..5].map do |day|
      Daily.new(day)
    end
  end

private

  def get_gif(summary)
    gif_info = GiffyService.new(summary)
    gif_info.url
  end

  def get_data(city_state)
    location = BingService.new(city_state)
    coordinates = location.coords
    sky = DarkskyService.new(coordinates)
    sky.get_forecast
  end

end

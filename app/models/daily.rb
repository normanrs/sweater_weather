class Daily

  attr_reader :day_of_week,
              :summary,
              :chance_of_precipitation,
              :temperature_high,
              :temperature_low,
              :gif_url

  def initialize(daily_in)
    @day_of_week             = daily_in[:time]
    @summary                 = daily_in[:summary]
    @chance_of_precipitation = daily_in[:precipProbability]
    @temperature_high        = daily_in[:temperatureHigh]
    @temperature_low         = daily_in[:temperatureLow]
    @gif_url                 = get_gif(daily_in[:summary])
  end

  def get_gif(summary)
    gif_info = GiffyService.new(summary)
    gif_info.url
  end

end

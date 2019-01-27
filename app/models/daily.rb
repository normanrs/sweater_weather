class Daily

  attr_reader :day_of_week,
              :summary,
              :chance_of_precipitation,
              :temperature_high,
              :temperature_low

  def initialize(daily_in)
    @day_of_week             = daily_in[:time]
    @summary                 = daily_in[:summary]
    @chance_of_precipitation = daily_in[:precipProbability]
    @temperature_high        = daily_in[:temperatureHigh]
    @temperature_low         = daily_in[:temperatureLow]
  end

end

class Hourly

  attr_reader :hour,
              :temperature

  def initialize(hourly_in)
    @hour        = hourly_in[:time]
    @temperature = hourly_in[:temperature]
  end

end

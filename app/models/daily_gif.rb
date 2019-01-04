class DailyGif

  attr_reader :time,
              :summary,
              :url

  def initialize(daily_in)
    @time             = daily_in.day_of_week
    @summary          = daily_in.summary
    @url              = get_gif(daily_in.summary)
  end


private

  def get_gif(summary)
    GiffyService.new(summary)
  end

end

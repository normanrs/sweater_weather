class DailyGif

  attr_reader :time,
              :summary,
              :url,
              :id

  def initialize(daily_in)
    @id               = daily_in.day_of_week
    @time             = daily_in.day_of_week
    @summary          = daily_in.summary
    @url              = get_gif(daily_in.summary)
  end


private

  def get_gif(summary)
    gif_info = GiffyService.new(summary)
    gif_info.url
  end

end

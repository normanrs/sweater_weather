class DailyGif

  attr_reader :time,
              :summary,
              :url,
              :id,
              :copyright

  def initialize(daily_in)
    @id               = daily_in.day_of_week
    @time             = daily_in.day_of_week
    @summary          = daily_in.summary
    @url              = get_gif(daily_in.summary)
    @copyright        = get_copyright(@time)
  end

private

  def get_copyright(date)
    new_date = DateTime.strptime(date.to_s,'%s')
    "Copyright #{new_date.year}"
  end

  def get_gif(summary)
    gif_info = GiffyService.new(summary)
    gif_info.url
  end

end

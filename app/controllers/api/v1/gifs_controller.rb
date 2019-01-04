class Api::V1::GifsController < ApiBaseController

  def show
    weather = Forecast.new(params_in[:location]).dailies
    daily_gif = DailyGif.new(weather)
    require "pry"; binding.pry
  end

private

  def params_in
    params.require(:action)
    params.permit(:location)
  end

end

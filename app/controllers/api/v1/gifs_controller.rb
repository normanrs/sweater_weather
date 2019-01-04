class Api::V1::GifsController < ApiBaseController

  def show
    weather = Forecast.new(params_in[:location]).dailies
    weather.map do |daily|
      DailyGif.new(daily)
    end
  end

private

  def params_in
    params.require(:action)
    params.permit(:location)
  end

end

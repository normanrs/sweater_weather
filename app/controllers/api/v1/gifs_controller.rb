class Api::V1::GifsController < ApiBaseController

  def show
    weather = Forecast.new(params_in[:location]).dailies
    daily_gifs = weather.map do |daily|
      DailyGif.new(daily)
    end
    render json: DailyGifSerializer.new(daily_gifs), status: 200
  end

private

  def params_in
    params.require(:action)
    params.permit(:location)
  end

end

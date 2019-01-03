class Api::V1::ForecastController < ApiBaseController

  def show
    weather = Forecast.new(params_in[:location])
    # render json: weather
    json_string = ForecastSerializer.new(weather).serialized_json
  end

private

  def params_in
    params.require(:action)
    params.permit(:location)
  end

end

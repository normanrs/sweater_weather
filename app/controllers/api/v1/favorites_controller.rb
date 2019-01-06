class Api::V1::FavoritesController < ApiBaseController

  def create
    user = User.find_by(api_key: params_in[:api_key])
    if user
      Favorite.create(user_id: user.id, location: params_in[:location])
      render json: FavoritesSerializer.new(user), status: 200
    else
      render json: "Request failed!", status: 401
    end
  end

private

  def params_in
    params.permit(:location, :api_key)
  end

end

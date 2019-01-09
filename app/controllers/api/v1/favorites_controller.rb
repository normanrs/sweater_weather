class Api::V1::FavoritesController < ApiBaseController

  def index
    user = User.find_by(api_key: params_in[:api_key])
    render json: FavoritesSerializer.new(user.favorites), status: 200
  end

  def create
    user = User.find_by(api_key: params_in[:api_key])
    if user
      Favorite.create(user_id: user.id, location: params_in[:location])
      render json: FavoritesSerializer.new(user.favorites), status: 200
    else
      render json: "Request failed!", status: 401
    end
  end

  def delete
    user = User.find_by(api_key: params_in[:api_key])
    if user
      user.favorites.find_by(location: params_in[:location]).destroy
      render json: FavoritesSerializer.new(user.favorites), status: 200
    else
      render json: "Request failed!", status: 401
    end
  end

private

  def params_in
    params.permit(:location, :api_key)
  end

end

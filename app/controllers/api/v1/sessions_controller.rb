class Api::V1::SessionsController < ApiBaseController

  def create
    user = User.find_by(email: params_in[:email])
    if user && user.authenticate(params_in[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: "Registration failed!", status: 401
    end
  end

private

  def params_in
    params.require(:action)
    params.permit(:email, :password)
  end

  def passwords_match?
    params[:password] == params[:password_confirmation]
  end

end

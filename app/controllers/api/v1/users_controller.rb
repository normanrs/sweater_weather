class Api::V1::UsersController < ApiBaseController

  def create
    user = User.new(params_in) if passwords_match?
    if passwords_match? && user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: "Registration failed!", status: 403
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

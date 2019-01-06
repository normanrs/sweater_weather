class Api::V1::SessionsController < ApiBaseController

  def create
    user = User.find_by(email: params_in[:email])
    if user && user.authenticate(params_in[:password])
      session[:user_id] = user.id.to_s
      render json: UserSerializer.new(user), status: 201
    else
      render json: "Registration failed!", status: 422
    end
  end

  def destroy
    session.delete(:user_id)
    render json: "Logged Out", status: 201
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

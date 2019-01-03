class Api::V1::UsersController < ApiBaseController

  def create
  end

private

  def params_in
    params.require(:action)
    params.permit(:email, :password, :password_confirmation)
  end

end

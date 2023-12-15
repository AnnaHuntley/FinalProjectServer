
class Api::V1::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      sign_in user, store: false
      render json: { user: user }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  protected

  def respond_to_on_destroy
    head :no_content
  end
end

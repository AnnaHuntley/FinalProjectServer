class Api::V1::SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: params[:user][:email])

    if user&.valid_password?(params[:user][:password])
      token = user.generate_authentication_token
      render json: { user: user, authentication_token: token }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end

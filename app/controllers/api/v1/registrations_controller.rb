class Api::V1::RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
      render turbo_stream: turbo_stream.replace("registration_success_message", partial: "devise/registrations/create")
    else
      render json: user.errors, status: :unprocessable_entity
      render turbo_stream: turbo_stream.replace("registration_error_message", partial: "devise/registrations/failure")
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

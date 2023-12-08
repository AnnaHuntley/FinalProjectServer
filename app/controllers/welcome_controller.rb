class WelcomeController < ApplicationController
  def index
    respond_to do |format|
      format.html { render plain: 'Welcome to the application' }
      format.json { render json: { message: 'Welcome to the application' } }
    end
  end
end

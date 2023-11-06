class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password])
    end
    def after_sign_up_path_for(resource)
        # Specify the path you want to redirect to after successful registration
        root_path
      end
      
  end
  
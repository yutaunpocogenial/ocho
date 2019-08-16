class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_in_path_for(opinions)
        '/speed'
    end

    def after_sign_out_path_for(opinions) 
      '/speed' 
    end



  

  protected

  
    def configure_permitted_parameters
      added_attrs = [ :username, :email, :password, :password_confirmation　]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end

  end

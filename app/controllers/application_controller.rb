class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private
 def sign_up_params
   params.require(:user).permit(:first_name, :last_name, :email, :password, 
   :password_confirmation)
 end
 
 def account_update_params
   params.require(:user).permit(:first_name, :last_name, :email, :password, 
   :password_confirmation, :current_password)
 end
end

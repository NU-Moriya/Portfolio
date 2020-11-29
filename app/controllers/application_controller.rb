class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_guest, only: [:update, :quit, :invalid]
  
  protected
  
  def after_sign_up_path_for(resource)
    user_path(current_user)
  end
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :account_name])
  end
  
  def check_guest
    user = User.find_by(account_name: "guest")
    if current_user == user
      redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。'
    end
  end
end

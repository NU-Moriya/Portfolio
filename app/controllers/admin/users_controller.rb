class Admin::UsersController < ApplicationController
  before_action :admin_user
  
  def index
    @users = User.all
  end
  
  def invalid
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    redirect_to admin_users_path
  end
    
  def update
    @user = User.find(params[:id])
    @user.update(classification: 1)
    redirect_to admin_users_path
  end
  
  
  private
    def admin_user
      redirect_to root_path unless current_user.admin?
    end
    
    def ensure_correct_user
      @user = User.find(params[:id])
      unless @user == current_user
      redirect_to user_path(current_user)
      end
    end
    
    def user_params
      params.require(:user).permit(:name, :account_id, :classification, :is_valid)
    end
end

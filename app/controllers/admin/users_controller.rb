class Admin::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.all
  end

  def invalid
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    redirect_to admin_users_path
    flash[:notice] = "ユーザーを無効会員に変更しました"
  end

  def update
    @user = User.find(params[:id])
    @user.update(classification: 1)
    redirect_to admin_users_path
    flash[:notice] = "法人区分に変更しました"
  end

  def search
    @account_name = params[:account_name]
    if params[:account_name].empty?
    else
      @account_name = params[:account_name]
      @users = User.search_for(@account_name)
    end
  end

  private

  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :account_name, :classification, :is_valid)
  end
end

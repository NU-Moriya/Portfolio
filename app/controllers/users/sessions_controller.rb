# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
     super
     flash[:notice] = "ログインしました！"
   end

  # DELETE /resource/sign_out
   def destroy
     super
     flash[:notice] = "ログアウトしました！"
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def new_guest
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: 'ようこそ、ゲストユーザーさん!!'
  end


  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_valid
        flash[:notice] = "退会済みです"
        redirect_to new_user_session_path
      end
    end
  end
end


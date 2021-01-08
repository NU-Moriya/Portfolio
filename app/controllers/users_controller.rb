class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit, :quit, :invalid]
  before_action :check_guest, only: [:update, :quit, :invalid]


  def show
    @user = User.find(params[:id])
    @commitments = @user.commitments
    # 以下、DM機能用のコントローラー記述
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |current|
        @userEntry.each do |user|
          if current.connect_id == user.connect_id
            @isConnect = true
            @connectId = current.connect_id
          end
        end
      end
      if @isConnect
      else
        @connect = Connect.new
        @entry = Entry.new
      end
    end
  end

  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = "編集完了しました!"
    else
      flash[:alert] = "エラーです。もう一度お試しください"
      render "edit"
    end
  end

  # 退会手続き用画面を表示
  def quit
    @user = current_user
  end

  # 退会手続き
  def invalid
    @user = current_user
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
    flash[:notice] = "退会しました。またこだわりさんと繋がりましょう!"
  end

  private

  def ensure_correct_user
    if current_user != User.find(params[:id])
      redirect_to user_path(current_user)
    end
  end

  def check_guest
    if current_user == User.find_by(account_name: "guest")
      redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。'
    end
  end

  def user_params
    params.require(:user).permit(:name, :account_name, :avatar, :introduction, :classification, :admin, :is_valid)
  end
end

class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Entry.where(user_id: current_user.id, connect_id: params[:message][:connect_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :connect_id).merge(user_id: current_user.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/connects/#{@message.connect_id}"
  end
end

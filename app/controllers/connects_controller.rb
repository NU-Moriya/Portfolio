class ConnectsController < ApplicationController

  before_action :authenticate_user!

  def create
    @connect = Connect.create
    @entry1 = Entry.create(connect_id: @connect.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :connect_id).merge(connect_id: @connect.id))
    redirect_to "/connects/#{@connect.id}"
  end

  def show
    @connect = Connect.find(params[:id])
    if Entry.where(user_id: current_user.id,connect_id: @connect.id).present?
      @messages = @connect.messages
      @message = Message.new
      @entries = @connect.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @user = current_user
    @currentEntries = current_user.entries
    myConnectIds = []

    @currentEntries.each do |entry|
      myConnectIds << entry.connect.id
    end
                                                            #user_id が @user.idでないEntry  子モデルのconnectデータも一緒にviewに持っていく
    @anotherEntries = Entry.where(connect_id: myConnectIds).where('user_id != ?',@user.id).includes(:connect).page(params[:page]).per(5)
    
  end

end

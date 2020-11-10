class CommitmentsController < ApplicationController
  
  def index
    @commitment = Commitment.new
    @commitments = Commitment.all
  end
  
  def show
    @commitment = Commitment.find(params[:id])
    @post = Post.new
    @posts = @commitment.posts
  end
  
  def create
    @commitment = Commitment.new(commitment_params)
    if @commitment.save
      redirect_to commitments_path, notice: "新しいこだわりルームができました"
    else
      flash.now[:alert] = 'エラー  入力項目を確認してください'
      render :index
    end
  end
  
  def search
  end
  
  private
    def commitment_params
      params.require(:commitment).permit(:room_name)
    end
    
  
end

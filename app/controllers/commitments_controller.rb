class CommitmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @commitment = Commitment.new
    @commitments = Commitment.all.page(params[:page]).per(9)
  end

  def show
    @commitment = Commitment.find(params[:id])
    @post = Post.new
    @posts = @commitment.posts.all.page(params[:page]).per(6)

  end

  def create
    @commitment = Commitment.new(commitment_params)
    if @commitment.save
      redirect_to commitment_path(@commitment)
      flash[:notice] = "新しいこだわりルームができました!"
    else
      @commitments = Commitment.all.page(params[:page]).per(9)
      flash.now[:alert] = "入力項目を確認してください"
      render 'index'
    end
  end

  def search
    @content = params[:content]
    @commitments = Commitment.search_for(@content).page(params[:page]).per(9)
  end

  private
    def commitment_params
      params.require(:commitment).permit(:room_name)
    end


end

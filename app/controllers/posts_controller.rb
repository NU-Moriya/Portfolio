class PostsController < ApplicationController
  
  def create

    commitment = Commitment.find(params["post"]["commitment_id"])
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.commitment_id = commitment.id 
    if post.save
      redirect_to commitment_path(commitment), notice: "こだわりを投稿しました"
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])  
    @post.destroy
    redirect_to posts_path
  end
  
  def search
  end
  
  def ranking
  end
  
  private
  def post_params
    params.require(:post).permit(:content, :image)
  end
  
end

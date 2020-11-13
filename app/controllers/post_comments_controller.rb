class PostCommentsController < ApplicationController
  before_action :authenticate_user!
    
  def create
    post = Post.find(params[:post_id])
    @comment = PostComment.new(post_comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = post.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.post_comments.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
  
end

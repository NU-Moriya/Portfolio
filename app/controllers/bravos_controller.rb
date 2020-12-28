class BravosController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @bravo = current_user.bravos.create(post_id: @post.id)
    @bravo.save
  end

  def index
  end

  def destroy
    raise
    puts "************************************"

    @post = Post.find(params[:post_id])
    @bravo = Bravo.find_by(post_id: params[:post_id], user_id: current_user.id)
    @bravo.destroy
  end
end

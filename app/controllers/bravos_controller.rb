class BravosController < ApplicationController
  
  def create
    bravo= current_user.bravos.create(post_id: params[:post_id])
    bravo.save
    redirect_back(fallback_location: root_path)
  end
  
  def index
  end
  
  def destroy
    bravo = Bravo.find_by(post_id: params[:post_id], user_id: current_user.id)
    bravo.destroy
    redirect_back(fallback_location: root_path)
  end
  
end

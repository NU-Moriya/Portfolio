class LikeCommitmentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    commitment = Commitment.find(params[:commitment_id])
    like_commitment = current_user.like_commitments.new(commitment_id: commitment.id)
    like_commitment.save
    redirect_to commitment_path(commitment)
  end
  
  #def index
    #@like_commitments = current_user.like_commitments 
 # end
  
  def destroy
    commitment = Commitment.find(params[:commitment_id])
    like_commitment = current_user.like_commitments.find_by(commitment_id: commitment.id)
    like_commitment.destroy
    redirect_to commitment_path(commitment)
  end
  
  
end

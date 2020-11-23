class LikeCommitmentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @commitment = Commitment.find(params[:commitment_id])
    @like_commitment = current_user.like_commitments.create(commitment_id: @commitment.id)
    @like_commitment.save
  end
  
  
  def destroy
    @commitment = Commitment.find(params[:commitment_id])
    @like_commitment = LikeCommitment.find_by(commitment_id: params[:commitment_id], user_id: current_user.id)
    @like_commitment.destroy
  end
  
  
end

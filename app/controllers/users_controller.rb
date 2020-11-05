class UsersController < ApplicationController
    
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
  end
  
  def quit
  end
  
  def invalid
  end
  
end

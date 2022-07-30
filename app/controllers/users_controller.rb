class UsersController < ApplicationController
  def show
    @user = User.all
  end
  
  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
  end
end

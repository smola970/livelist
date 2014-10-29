class FollowsController < ApplicationController

  def create
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to user_path(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to user_path(params[:id])
  end
end

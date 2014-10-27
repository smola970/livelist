class UsersController < ApplicationController
  skip_before_action :authenticate
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/', :notice => 'Congratulations! You have successfully created an account for livelist.'
    else
      render :new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password_digest, :display_name, :email, :instagram_id)
  end
end
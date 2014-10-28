class UsersController < ApplicationController
  skip_before_action :authenticate
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', :notice => 'Congratulations! You have successfully created an account for livelist.'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @lists = List.where(:user_id => params[:id]).order("created_at")
    @goals = Goal.where(:user_id => params[:id]).order("created_at")
    @goals_to_do = Goal.where(:user_id => params[:id], complete: false).order("created_at").reverse
    @goals_completed = Goal.where(:user_id => params[:id], complete: true).order("updated_at").reverse
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :display_name, :email, :instagram_id)
  end
end
class UsersController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to friends_path, :notice => 'Congratulations! You have successfully created an account for livelist.'
    else
      flash[:error] = "Login Error"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @lists = List.where(:user_id => params[:id]).order("created_at")
    @goals = Goal.where(:user_id => params[:id]).order("created_at")
    @goals_to_do = Goal.where(:user_id => params[:id], complete: false).order("created_at").reverse
    @goals_completed = Goal.where(:user_id => params[:id], complete: true).order("updated_at").reverse
    render layout: false
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :display_name, :email, :instagram_id, :profile_image_url, :cover_image_url)
  end
end

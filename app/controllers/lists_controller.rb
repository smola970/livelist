class ListsController < ApplicationController

  def index
    @lists = List.where(:user_id => current_user.id).order("created_at")
  end

  def show
    @list = List.find(params[:id])
    @goals_to_do = Goal.where(:list_id => params[:id], complete: false).order("created_at")
    @goals_completed = Goal.where(:list_id => params[:id], complete: true).order("updated_at").reverse
    session[:list_id] = params[:id]
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to manage_lists_path
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to manage_lists_path
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    @goals = Goal.where(:list_id => params[:id])
    @goals.each do |goal|
      goal.destroy
    end
    redirect_to manage_lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end

class ListsController < ApplicationController

  def index
    @lists = List.where(:user_id => current_user.id)
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to '/manage_lists'
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
    redirect_to '/manage_lists'
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to '/manage_lists'
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end

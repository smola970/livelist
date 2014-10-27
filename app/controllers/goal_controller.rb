class GoalsController < ApplicationController

  def index
    @goals = Goal.where(:list_id => params[:id])
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to 'lists/:id'
    else
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    redirect_to 'lists/:id'
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to 'lists/:id'
  end

  private

  def goal_params
    params.require(:goal).permit(:original_goal_id, :text, :list_id, :category_id, :complete, :image_url, :caption )
  end
end



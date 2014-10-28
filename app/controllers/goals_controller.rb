class GoalsController < ApplicationController

  def index
    # @goals = Goal.where(:list_id => params[:id])
    # @list = List.where(params[:id])
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.list_id = session[:list_id]
    if @goal.save
      @goal.original_goal_id = @goal.id
      @goal.save
      session[:list_id] = nil
      redirect_to list_path(@goal.list_id)
    else
      render :new
    end
  end

  def new_clone
    @goal = Goal.find(params[:id])
    @goal_clone = Goal.new
  end

  def create_clone
    @goal = Goal.find(params[:id])
    goal_attributes = @goal.attributes
    @goal_clone = Goal.new
    @goal_clone.text = goal_attributes.text
    @goal_clone.original_goal_id = goal_attributes.original_goal_id
    @goal_clone.category_id = goal_attributes.category_id

    if @goal_new.save
      redirect_to list_goal_path(params[:list_id], @goal_new.id)
    end
  end

  def completed_edit
    @goal = Goal.find(params[:id])
  end

  def completed_update
    @goal = Goal.find(params[:id])
    @goal.complete = true
    @goal.update(goal_params)
    if @goal.save
      redirect_to list_path(@goal.list_id)
    else
      render :completed_edit
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    redirect_to list_path(@goal.list_id)
  end

  def destroy
    @goal = Goal.find(params[:id])
    @list_id = @goal.list_id
    @goal.destroy
    redirect_to list_path(@list_id)
  end

  private

  def goal_params
    params.require(:goal).permit(:text, :category_id, :image_url, :caption )
  end
end



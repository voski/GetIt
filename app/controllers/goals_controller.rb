class GoalsController < ApplicationController
  before_action :ensure_privacy, only: [:show]

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:error] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:error] = @goal.errors.full_messages
      render :edit
    end
  end

  private

  def ensure_privacy
    @goal = Goal.find(params[:id])
    redirect_to root_url if (!@goal.author?(current_user) && @goal.private?)
  end

  def goal_params
    params.require(:goal).permit(:name, :status, :completion)
  end
end

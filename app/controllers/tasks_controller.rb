class TasksController < ApplicationController
  
  def index
    @tasks = Task.includes(:priority, :users, :assigned_user).all
    render json: @tasks, include: [:priority, :users, :assigned_user]
  end

  def show
    @task = Task.find(params[:id])
    render json: @task, include: [:priority, :users, :assigned_user]
  end

  def create
    @task = Task.new(task_params)
    puts "----------------------------------@task-------------------------#{@task.inspect}"
    if @task.save!
      render json: @task, include: [:priority, :users], status: :created
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render json: @task, include: [:priority, assigned_to: { only: [:id, :name] }]
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head :no_content
  end

  private
  def task_params
    params.permit(:title, :description, :status, :priority_id, :assigned_to, :due_date)
  end
end

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :details))
    @task.save
    redirect_to("/tasks")
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params.require(:task).permit(:title, :details, :completed))
    redirect_to("/tasks")
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to("/tasks")
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
end

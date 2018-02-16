class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    pick_a_task

  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path
  end

  def edit
    pick_a_task
  end

  def update
    pick_a_task
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    pick_a_task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def pick_a_task
    @task = Task.find(params[:id])
  end

end

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # needed to instantiate the form_for
  end

def create
    @task = Task.new(restart_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  private

  def restart_params
    params.require(:task).permit(:title, :details, :completed)
  end
end

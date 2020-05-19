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

def edit
  @task = Task.find(params[:id])
end

def update
  @task = Task.find(params[:id])
  @task.update(params[:task])
   # Will raise ActiveModel::ForbiddenAttributesError
  redirect_to task_path(@task)
end

private

def restart_params
  params.require(:task).permit(:title, :details, :completed)
end
end

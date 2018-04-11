class TasksController < ApplicationController
  
  def index
    render json: Task.order(:id) # the controller won't seek an index.html.erb file to render;
                          # it's rendering the data in json format
  end

  def update
    task = Task.find(params[:id])

    task.update_attributes(task_params)
    render json: task
  end

  def create
    task = Task.create(task_params)
    render json: task
  end

  private

  def task_params
    params.require(:task).permit(:title, :done)
  end
end

class TasksController < ApplicationController
  def index
    render json: Task.all.order(:id) # the controller won't seek an index.html.erb file to render;
                          # it's rendering the data in json format
  end

  def update
    task = Task.find(params[:id])

    task.update_attributes(task_params)
    render json: task
  end

  private

  def task_params
    params.require(:task).permit(:done)
  end
end

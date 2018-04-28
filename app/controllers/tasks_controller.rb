class TasksController < ApplicationController
  
  def index
    resp = {
      properties: Task.counts,
      tasks: Task.order(:id).reverse_order
    }

    render json: resp     #Task.order(:id) # the controller won't seek an index.html.erb file to render;
                         # it's rendering the data in json format
  end

  def update
    task = Task.find(params[:id])

    task.update_attributes(task_params)
    render json: { properties: Task.counts, task: task }
  end

  def create
    task = Task.create(task_params)
    render json: { properties: Task.counts, task: task }
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: { properties: Task.counts, task: task }
  end

  private

  def task_params
    params.require(:task).permit(:title, :done)
  end
end

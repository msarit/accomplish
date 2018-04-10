class TasksController < ApplicationController
  def index
    render json: Task.all # the controller won't seek an index.html.erb file to render;
                          # it's rendering the data in json format
  end
end

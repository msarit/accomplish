require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe "tasks#destroy" do
    it "should allow tasks to be destroyed" do
      task1 = FactoryBot.create(:task)

      delete :destroy, params: {id: task1.id}
      expect(response).to have_http_status(:success)
      
      # response_value = ActiveSupport::JSON.decode(@response.body)
      # expect(response_value['title']).to eq nil
    end
  end

  # describe "tasks#create" do
  #   it "should allow new tasks to be created" do
  #     post :create, params: {task: { title: "Feed Baby" }}
  #     expect(response).to have_http_status(:success)

  #     response_value = ActiveSupport::JSON.decode(@response.body)
  #     expect(response_value['title']).to eq("Feed Baby")
  #     expect(Task.last.title).to eq("Feed Baby")
  #   end
  # end

  # describe "tasks#index" do
  #   it "should list the tasks in the database" do
  #     task1 = FactoryBot.create(:task)
  #     task2 = FactoryBot.create(:task)
  #     task1.update_attributes(title: "Something else")
  #     get :index
  #     expect(response).to have_http_status :success

  #     response_value = ActiveSupport::JSON.decode(@response.body)
  #     expect(response_value.count).to eq(2) # still works without brackets
  #     response_ids = response_value.collect do |task|
  #       task["id"]
  #     end
  #     expect(response_ids).to eq([task1.id, task2.id])
  #   end
  # end

  # describe "tasks#update" do
  #   it "should allow tasks to be marked as done" do
  #     task = FactoryBot.create(:task, done: false)
  #     put :update, params: {id: task.id, task: { done: true }}
  #     expect(response).to have_http_status :success

  #     task.reload
  #     expect(task.done).to eq true
  #   end
  # end
end

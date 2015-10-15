require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:project) { create :project }
    it "returns http success" do
      get :show, id: project.to_param
      expect(response).to have_http_status(:success)
    end
  end
end

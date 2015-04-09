class ProjectsController < ApplicationController
  def index
    @projects = Project.order(created_at: :desc)
  end

  def show
    @project = Project.friendly.find(params[:id])
    respond_to do |format|
      format.modal
    end
  end
end

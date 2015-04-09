class HomeController < ApplicationController
  def index
    @institutes = Institute.order(:name_en, :name_fr)
    @projects = Project.active.order(created_at: :desc)
    @contacts = Contact.order(:name)
  end
end

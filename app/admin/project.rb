ActiveAdmin.register Project do

  permit_params :name_en, :name_fr, :description_en, :description_fr, :laboratory_id, :archived_at, :slug_fr, :slug_en

  controller do
    def find_resource
      begin
        scoped_collection.where("slug_#{I18n.locale}" => params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end

  index do
    selectable_column
    column :laboratory
    column :name_fr
    column :name_en
    actions
  end



  form do |f|
    # f.object.errors
    # # f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :laboratory
      f.input :name_en
      f.input :name_fr
      f.input :description_en
      f.input :description_fr
      f.input :slug_en
      f.input :slug_fr
      f.input :archived_at, as: :datepicker
    end
    f.actions
  end

end



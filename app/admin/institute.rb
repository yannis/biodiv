ActiveAdmin.register Institute do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name_en, :name_fr, :description_en, :description_fr, illustrations_attributes: [:id, :picture, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


  form do |f|
    f.object.errors
    # f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :name_en
      f.input :name_fr
      f.input :description_en
      f.input :description_fr
    end
    f.inputs "Illustrations" do
      f.has_many :illustrations do |j|
        if j.object.new_record?
          j.input :picture, :as => :file
        else
          j.input :_destroy, :as => :boolean, :hint => f.template.image_tag(j.object.picture.url(:thumb_xs))
        end
      end
    end
    f.actions
  end

end

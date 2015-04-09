ActiveAdmin.register Institute do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name_en, :name_fr, :description_en, :description_fr, :url, illustrations_attributes: [:id, :picture, :_destroy], logo_attributes: [:id, :picture, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


  form do |f|
    # f.object.errors
    # # f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :name_en
      f.input :name_fr
      f.input :description_en
      f.input :description_fr
      f.input :url
    end
    f.inputs do
      f.has_many :illustrations, heading: 'Illustrations', allow_destroy: true, new_record: true do |a|
        a.input :picture, as: :file, hint: (a.object.new_record? ? nil : image_tag(a.object.picture.url(:thumb_xs)))
      end
    end
    f.inputs "Logo", for: [:logo, f.object.logo || Logo.new] do |j|
      if f.object.logo.present?
        j.input :_destroy, as: :boolean, hint: image_tag(j.object.picture.url(:thumb_xs))
      else
        j.input :picture, as: :file
      end
    end
    f.actions
  end

end



class Illustration < ActiveRecord::Base
  belongs_to :illustrable, polymorphic: true

  mount_uploader :picture, PictureUploader
end

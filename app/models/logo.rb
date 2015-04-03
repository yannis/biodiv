class Logo < ActiveRecord::Base
  belongs_to :logotable, polymorphic: true

  mount_uploader :picture, PictureUploader
end

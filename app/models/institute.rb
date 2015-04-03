class Institute < ActiveRecord::Base
  has_many :illustrations, as: :illustrable, dependent: :destroy
  has_many :logos, as: :logotable, dependent: :destroy

  accepts_nested_attributes_for :illustrations, :allow_destroy => true
end

require "translate"
class Institute < ActiveRecord::Base
  has_many :illustrations, as: :illustrable, dependent: :destroy
  has_many :laboratories, inverse_of: :institute
  has_one :logo, as: :logotable, dependent: :destroy

  accepts_nested_attributes_for :illustrations, allow_destroy: true
  accepts_nested_attributes_for :logo, allow_destroy: true

  translate :name, :description
end

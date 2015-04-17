require "translate"
class Laboratory < ActiveRecord::Base
  belongs_to :institute, inverse_of: :laboratories
  has_many :projects, inverse_of: :laboratory
  translate :name

  validates_presence_of :name_fr
  validates_uniqueness_of :name_fr

  before_validation :set_name
  # before_save :format_address
private

  def set_name
    if self.name_fr.present? && self.name_en.blank?
      self.name_en = self.name_fr
    end
    if self.name_en.present? && self.name_fr.blank?
      self.name_fr = self.name_en
    end
  end

  def format_address
    if self.address
      self.address.gsub!("\n", "<br />")
    end
  end
end

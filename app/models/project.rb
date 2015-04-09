require "translate"
class Project < ActiveRecord::Base
  extend FriendlyId
  translate :name, :description_html
  friendly_id :name, :use => [:simple_i18n]

  belongs_to :laboratory, inverse_of: :projects
  before_validation :set_description, :set_name
  before_save :regenerate_html

  validates_presence_of :name_fr
  validates_uniqueness_of :name_fr, scope: :laboratory_id

  def self.active
    where("projects.archived_at IS NULL OR projects.archived_at > ?", Time.current)
  end

private

  def set_description
    if self.description_fr.present? && self.description_en.blank?
      self.description_en = self.description_fr
    end
    if self.description_en.present? && self.description_fr.blank?
      self.description_fr = self.description_en
    end
  end

  def set_name
    if self.name_fr.present? && self.name_en.blank?
      self.name_en = self.name_fr
    end
    if self.name_en.present? && self.name_fr.blank?
      self.name_fr = self.name_en
    end
  end

  def regenerate_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    if self.description_fr
      self.description_html_fr = markdown.render(self.description_fr)
    end
    if self.description_en
      self.description_html_en = markdown.render(self.description_en)
    end
  end
end

class AddMarkdownToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :description_html_fr, :text
    add_column :projects, :description_html_en, :text
  end
end

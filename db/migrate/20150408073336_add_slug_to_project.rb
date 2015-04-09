class AddSlugToProject < ActiveRecord::Migration
  def change
    add_column :projects, :slug_en, :string
    add_index :projects, :slug_en
    add_column :projects, :slug_fr, :string
    add_index :projects, :slug_fr
  end
end

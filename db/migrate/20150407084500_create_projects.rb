class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name_en
      t.string :name_fr
      t.text :description_en
      t.text :description_fr
      t.references :laboratory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

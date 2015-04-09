class CreateLaboratories < ActiveRecord::Migration
  def change
    create_table :laboratories do |t|
      t.string :name_en
      t.string :name_fr
      t.string :url
      t.text :address
      t.references :institute, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateInstitutes < ActiveRecord::Migration
  def change
    create_table :institutes do |t|
      t.string :name_en
      t.string :name_fr
      t.text :description_en
      t.text :description_fr

      t.timestamps null: false
    end
  end
end

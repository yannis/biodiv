class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.string :picture
      t.references :logotable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end

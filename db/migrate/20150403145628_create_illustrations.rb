class CreateIllustrations < ActiveRecord::Migration
  def change
    create_table :illustrations do |t|
      t.text :legend
      t.string :picture
      t.references :illustrable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end

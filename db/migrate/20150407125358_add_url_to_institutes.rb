class AddUrlToInstitutes < ActiveRecord::Migration
  def change
    add_column :institutes, :url, :string
  end
end

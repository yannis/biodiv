class AddArchivedAtToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :archived_at, :timestamp
  end
end

class AddProjectIdToAssignments < ActiveRecord::Migration
  def self.up
    add_column :assignments, :project_id, :integer
  end

  def self.down
    remove_column :assignments, :project_id
  end
end

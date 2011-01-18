class AddProjectIdToFlows < ActiveRecord::Migration
  def self.up
    add_column :flows, :project_id, :integer
  end

  def self.down
    remove_column :flows, :project_id
  end
end

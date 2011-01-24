class ChangeFlowToReferToFeature < ActiveRecord::Migration
  def self.up
    add_column :flows, :feature_id, :integer
    remove_column :flows, :project_id, :integer
  end

  def self.down
    add_column :flows, :project_id, :integer
    remove_column :flows, :feature_id, :integer
  end
end

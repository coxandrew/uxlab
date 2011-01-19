class CreateScreens < ActiveRecord::Migration
  def self.up
    create_table :screens do |t|
      t.string :name
      t.text :caption
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :flow_id

      t.timestamps
    end
  end

  def self.down
    drop_table :screens
  end
end

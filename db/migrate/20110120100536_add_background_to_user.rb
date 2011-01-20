class AddBackgroundToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :background_file_name, :string
    add_column :users, :background_content_type, :string
    add_column :users, :background_file_size, :integer
  end

  def self.down
    remove_column :users, :background_file_size
    remove_column :users, :background_content_type
    remove_column :users, :background_file_name
  end
end

class AddAuthTypeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :auth_type, :string, :default => "sign_up"
    add_column :users, :fb_uid, :integer
  end

  def self.down
    remove_column :users, :auth_type
    remove_column :users, :fb_uid
  end
end
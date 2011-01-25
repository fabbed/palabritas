class AddTokenToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :last_access_token, :string
    add_column :users, :all_values_valid, :boolean, :default => false
  end

  def self.down
    remove_column :users, :last_access_token
  end
end
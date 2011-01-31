class AddSignUpTrackedToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :signup_tracked, :boolean, :default => false
  end

  def self.down
    remove_column :users, :signup_tracked
  end
end
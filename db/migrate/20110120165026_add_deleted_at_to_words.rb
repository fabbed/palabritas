class AddDeletedAtToWords < ActiveRecord::Migration
  def self.up
    add_column :words, :deleted_at, :datetime
  end

  def self.down
    remove_column :words, :deleted_at
  end
end

class AddDeletedAtToWordSets < ActiveRecord::Migration
  def self.up
    add_column :word_sets, :deleted_at, :datetime
  end

  def self.down
    remove_column :word_sets, :deleted_at
  end
end

class AddDeletedAtToWordSetToWords < ActiveRecord::Migration
  def self.up
    add_column :word_set_to_words, :deleted_at, :datetime
  end

  def self.down
    remove_column :word_set_to_words, :deleted_at
  end
end

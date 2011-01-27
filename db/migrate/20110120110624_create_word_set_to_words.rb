class CreateWordSetToWords < ActiveRecord::Migration
  def self.up
    create_table :word_set_to_words do |t|
      t.integer :word_set_id
      t.integer :word_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :word_set_to_words
  end
end

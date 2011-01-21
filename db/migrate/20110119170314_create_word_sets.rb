class CreateWordSets < ActiveRecord::Migration
  def self.up
    create_table :word_sets do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :note

      t.timestamps
    end

  end

  def self.down
    drop_table :word_sets
  end
end

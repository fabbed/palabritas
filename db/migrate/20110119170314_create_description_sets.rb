class CreateDescriptionSets < ActiveRecord::Migration
  def self.up
    create_table :description_sets do |t|
      t.integer :set_id
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :word_id
      t.integer :position
      t.string :note

      t.timestamps
    end

    add_index "description_sets", ["receiver_id", "word_id"], :name => "index_user_id_on_word_id"

  end

  def self.down
    drop_table :description_sets
  end
end

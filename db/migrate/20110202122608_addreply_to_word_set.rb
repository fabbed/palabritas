class AddreplyToWordSet < ActiveRecord::Migration
  def self.up
    add_column :word_sets, :reply, :string
  end

  def self.down
    remove_column :word_sets, :reply
  end
end
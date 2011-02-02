class WordSet < ActiveRecord::Base

  # acts_as_paranoid

  acts_as_commentable

  belongs_to :receiver, :class_name => "User"
  belongs_to :sender, :class_name => "User"
  has_many :word_set_to_words
  has_many :words, :through => :word_set_to_words
  
  def self.create_set(words_hash, note, sender_id = nil)

    new_set = self.create(:note => note, :sender_id => sender_id)
    
    words_hash.each_with_index do |word, i|
      unless word[1] == ""
        word = Word.find_or_create_by_word(word[1])
        new_set.word_set_to_words.create(:word => word, :position => i+1)
      end
    end

  end



end

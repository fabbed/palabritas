class WordSetToWord < ActiveRecord::Base

  # acts_as_paranoid


  belongs_to :word_set
  belongs_to :word
  


end

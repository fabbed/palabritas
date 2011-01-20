class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :display_name, :words_attributes, :avatar, :background
  
  has_many :description_sets, :foreign_key => :receiver_id
  has_many :words, :through => :description_sets

  has_attached_file :avatar,
      :styles => {
       :thumb=> "100x100#" }

  has_attached_file :background,
      :styles => {
      :thumb=> "100x100#",
      :small  => "400x400>" }



  def add_description_set(words)
    set_id = (DescriptionSet.maximum("set_id") || 0) + 1
    words.each_with_index do |word, i|
      unless word[1] == ""
        word = Word.find_or_create_by_word(word[1])
        self.description_sets << DescriptionSet.create(:word_id => word.id, :set_id => set_id, :note => "TODO", :sender_id => nil, :position => i+1)
      end
    end
  end


  def sets
    self.description_sets.flatten.map(&:set_id).uniq.sort
  end

end
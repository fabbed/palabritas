class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :display_name, :words_attributes, :avatar, :background, :delete_photo_avatar, :delete_photo_background, :profile_public, :fb_uid, :auth_type, :last_access_token, :all_values_valid

  has_many :word_sets, :foreign_key => :receiver_id

  has_many :received_word_sets, :class_name => "WordSet", :foreign_key => :receiver_id
  has_many :sent_word_sets, :class_name => "WordSet", :foreign_key => :sender_id

  has_many :received_word_to_word_sets, :through => :received_word_sets, :source => :word_set_to_words

  validates_presence_of :display_name
  validates_presence_of :email
  validates_presence_of :username
  # validates_presence_of :password
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates_length_of :display_name, :within => 4..30
  validates_length_of :username, :within => 4..20
  # validates_length_of :password, :within => 4..15
  
  #TODO: Other validations

  before_validation :clear_photo

  has_attached_file :avatar,
      :styles => {
       :thumb =>"50x50#",
       :medium => "100x100#" }

  has_attached_file :background,
      :styles => {
      :thumb=> "100x100#",
      :small  => "400x400>" }


  def received_words_as_array
    words = received_word_to_word_sets.inject([]){ |words, word_set_to_word| words <<  word_set_to_word.word.word}
  end

  def uniq_received_words_as_array_with_count
    words = received_word_to_word_sets.inject([]){ |words, word_set_to_word| words <<  word_set_to_word.word.word}
    uniq_words = {}
    words.each do |word|
      unless uniq_words[word]
        uniq_words[word] = 1
      else
        uniq_words[word] = uniq_words[word] + 1
      end
    end
    uniq_words = uniq_words.inject([]) { |words, word_hash| words << "#{word_hash[0]} (#{word_hash[1]})" }
    uniq_words
  end


  def delete_photo_avatar=(value)
    @delete_photo_avatar = !value.to_i.zero?
  end

  def delete_photo_background=(value)
    @delete_photo_background = !value.to_i.zero?
  end

  def get_username
    username  == "" ? "no valido" : username
  end

  def is_facebook_user?
    auth_type == "facebook"
  end

  def delete_photo_avatar
    !!@delete_photo_avatar
  end

  def delete_photo_background
    !!@delete_photo_background
  end


  alias_method :delete_photo_avatar?, :delete_photo_avatar
  alias_method :delete_photo_background?, :delete_photo_background
  
  def clear_photo
    self.avatar = nil if delete_photo_avatar?
    self.background = nil if delete_photo_background?
  end


end
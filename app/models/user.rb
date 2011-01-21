class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :display_name, :words_attributes, :avatar, :background, :delete_photo_avatar, :delete_photo_background, :profile_public
  
  has_many :word_sets, :foreign_key => :receiver_id
  has_many :words, :through => :word_sets


  has_many :received_word_sets, :class_name => :word_sets, :foreign_key => :receiver_id
  has_many :sent_word_sets, :class_name => :word_sets, :foreign_key => :sender_id


  before_validation :clear_photo

  has_attached_file :avatar,
      :styles => {
       :thumb=> "100x100#" }

  has_attached_file :background,
      :styles => {
      :thumb=> "100x100#",
      :small  => "400x400>" }

  def delete_photo_avatar=(value)
    @delete_photo_avatar = !value.to_i.zero?
  end

  def delete_photo_background=(value)
    @delete_photo_background = !value.to_i.zero?
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
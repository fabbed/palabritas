class DescriptionSet < ActiveRecord::Base

  belongs_to :receiver, :class_name => :user
  belongs_to :sender, :class_name => :user
  belongs_to :word
  
  
end

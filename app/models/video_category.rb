class VideoCategory < ActiveRecord::Base
  attr_accessible :category
  
  has_many :videos, dependent: :destroy
    
  belongs_to :user
  
  validates :user_id, presence: true
  validates :category, presence: true, length: {maximum: 30}, uniqueness: {:scope => :user_id}
  
end

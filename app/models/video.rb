class Video < ActiveRecord::Base
  attr_accessible :video_category_id, :title, :url
  
  belongs_to :video_category
  
  VALID_URL_REGEX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  
  validates :video_category_id, presence: true
  validates :title, presence: true, length: {maximum: 50}, uniqueness: true
  validates :url, presence: true, length: {maximum: 50}, format: { with: VALID_URL_REGEX }
  
  
    
  
end

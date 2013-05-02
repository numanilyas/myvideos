class Video < ActiveRecord::Base
  attr_accessible :video_category_id, :title, :url
  
  belongs_to :video_category
  
  VALID_URL_REGEX = /^https?:\/\/(?:[0-9A-Z-]+\.)?(?:youtu\.be\/|youtube\.com\S*[^\w\-\s])([\w\-]{11})(?=[^\w\-]|$)(?![?=&+%\w]*(?:['"][^<>]*>|<\/a>))[?=&+%\w-]*/ix
  
  validates :video_category_id, presence: true
  validates :title, presence: true, length: {maximum: 50}, uniqueness: true
  validates :url, presence: true, length: {maximum: 50}, format: { with: VALID_URL_REGEX } 
    
  
end

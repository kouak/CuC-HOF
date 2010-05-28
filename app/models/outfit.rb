class Outfit < ActiveRecord::Base
  
  belongs_to :uploader, :class_name => 'User'
  
  belongs_to :poll
  
  has_many :votes
  
  validates_presence_of :image_url
  validates_format_of :image_url, :with => URI::regexp(%w(http https))
  
  validates_presence_of :member_name
  
  attr_accessible :image_url, :member_id, :member_name, :title
  
  
end

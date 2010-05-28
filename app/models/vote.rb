class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll
  belongs_to :outfit
  
  validates_presence_of :user_id
  validates_presence_of :poll_id
  validates_presence_of :outfit_id
  
  validates_uniqueness_of :user_id, :scope => :poll_id
  
  attr_accessible :user_id, :score, :poll_id, :outfit_id
  
  def after_initialize
    self.poll_id ||= self.outfit.poll_id
    self.score ||= 1
  end
end

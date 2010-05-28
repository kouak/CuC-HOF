class Poll < ActiveRecord::Base
  validates_presence_of :start
  validates_presence_of :end
  
  has_many :outfits, :dependent => :destroy
  
  scope :pending, where(:state => 'pending')
  scope :ongoing, where(:state => 'ongoing')
  scope :closed, where(:state => 'closed')
  
  POLL_PERIOD = 1.month
  
  state_machine :state, :initial => :pending do
    event :open do
      transition :pending => :ongoing
    end
    
    event :close do
      transition :ongoing => :closed
    end
    
    state :ongoing
    state :closed
    state :pending
  end
  
  def after_initialize
    self.start ||= self.next_poll_start_time + 1.month # Poll will be open starting a month from now
    self.end ||= self.start + 1.month # for 1 month
  end
  
  def after_create
    #self.rotate_polls
  end
  
  def self.rotate_polls
    self.close_ongoing_polls
    self.open_pending_polls
  end
  
  
  def self.next_poll_start_time
    #end of current
  end
  
  private
  # if needed, closes current poll and opens a new one
  def self.close_ongoing_polls
    self.ongoing.where('end <=', Time.now).each do |poll|
      poll.close
    end
  end
  
  def self.open_pending_polls
    self.pending.where('start <=', Time.now).each do |poll|
      poll.open
    end
  end
end

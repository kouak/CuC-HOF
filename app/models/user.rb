class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation
  
  validates_presence_of :username
  validates_length_of :username, :in => 2..60
  
  has_many :outfits, :dependent => :nullify
  
  def vote_for(outfit)
    return unless outfit.is_a?(Outfit)
    outfit.votes.new(:user_id => self.id).save
  end
end

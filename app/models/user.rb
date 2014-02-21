class User < ActiveRecord::Base
  has_secure_password
  has_many :attendances
  before_save { |user| user.email = email.downcase } 
  before_save :create_remember_token
  validates_presence_of :password, :on => :create
  
  include Gravtastic
  gravtastic :default => :identicon
  
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: VALID_EMAIL }, 
  uniqueness: { case_sensitive: false }
  
  validates :nickname, presence: true
  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

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
  
  #def self.search(search)
  #  if search
      #joins(:attendances).where(:all, :conditions => ['attendances.attended_on LIKE ?', "%#{search}%"])
      #joins(:attendances).where(attendances: {attended_on: ['attendances.attended_on LIKE ?', "%#{search}%"]})
  #    present(search)#.where('attendances.attended_on LIKE ?', "%#{search}%")
      #absent(search)
      #@search = search.to_date
      #debugger
  #  else
  #    present(Date.today)
  #  end
  #end
  
  def self.in_seat(seat_num, now=Date.today)
    present(now).where('attendances.seat_num = ?', seat_num)
  end

  def self.absent(now=Date.today)
    where.not(id: present(now))
  end

  def self.present(now=Date.today)
    joins(:attendances).where(attendances: {attended_on: now})
  end
  
  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

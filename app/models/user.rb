class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :default => :identicon
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true { case_sensitive: false }
  validates :nickname, presence: true
end

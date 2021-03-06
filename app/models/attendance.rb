class Attendance < ActiveRecord::Base
  belongs_to :user
  validates :attended_on, uniqueness: {scope: :user_id, message: "you already logged your attendance today"}
  validates :seat_num, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 5}
  
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end

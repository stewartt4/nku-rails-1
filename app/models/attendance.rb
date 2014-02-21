class Attendance < ActiveRecord::Base
  belongs_to :user
  validates :seat_num, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 5}
end

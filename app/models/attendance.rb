class Attendance < ActiveRecord::Base
    validates :seat_num, presence: true, length: { in: 1..4 }
end

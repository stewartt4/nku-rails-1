class AddExpireToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :expire, :date
  end
end

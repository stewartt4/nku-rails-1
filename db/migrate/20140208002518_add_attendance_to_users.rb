class AddAttendanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :attendence, :boolean
  end
end

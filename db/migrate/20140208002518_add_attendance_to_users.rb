class AddAttendanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :attendance, :boolean
  end
end

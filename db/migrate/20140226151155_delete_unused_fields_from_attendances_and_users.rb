class DeleteUnusedFieldsFromAttendancesAndUsers < ActiveRecord::Migration
  def change
    remove_column :attendances, :student_name, :string
    remove_column :attendances, :expire, :date
    remove_column :users, :attendence, :boolean
    remove_column :users, :attendance, :boolean
    remove_column :users, :seat_num, :integer
    remove_column :users, :seat_num, :integer
    remove_column :users, :attended_on, :date
    remove_column :users, :expire, :date
  end
end

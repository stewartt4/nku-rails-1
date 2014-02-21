class DeleteStudentidFromAttendance < ActiveRecord::Migration
  def change
    remove_column :attendances, :student_id, :integer
  end
end

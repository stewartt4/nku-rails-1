class AddAssignmentNameToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :assignment_name, :string
    add_column :assignments, :student_id, :integer
  end
end

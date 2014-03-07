class AddPercentageAndAverageToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :percentage, :decimal
    add_column :assignments, :average, :decimal
  end
end

class RemovePercentageAndAverageToAssignment < ActiveRecord::Migration
  def change
    remove_column :assignments, :percentage, :decimal
    remove_column :assignments, :average, :decimal
  end
end

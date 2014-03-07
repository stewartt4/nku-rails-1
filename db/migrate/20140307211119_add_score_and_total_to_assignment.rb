class AddScoreAndTotalToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :score, :decimal
    add_column :assignments, :total, :decimal
  end
end

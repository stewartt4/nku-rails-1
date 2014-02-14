class AddTimestampToUser < ActiveRecord::Migration
  def change
    add_column :users, :attended_on, :date
  end
end

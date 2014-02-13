class AddSeatNumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :seat_num, :integer
  end
end

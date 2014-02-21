class AddExpireToUser < ActiveRecord::Migration
  def change
    add_column :users, :expire, :date
  end
end

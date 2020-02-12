class RemoveBirthdayToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :birthday_y
    remove_column :users, :birthday_m
    remove_column :users, :birthday_d
  end
end

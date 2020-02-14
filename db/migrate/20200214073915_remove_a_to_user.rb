class RemoveAToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :nickname
    remove_column :users, :famiry_name
    remove_column :users, :first_name
    remove_column :users, :famiry_name_kana
    remove_column :users, :first_name_kana
    remove_column :users, :image
    remove_column :users, :profile
    remove_column :users, :status
    remove_column :users, :postal_code
    remove_column :users, :adress_prefecture
    remove_column :users, :adress_town
    remove_column :users, :adress_number
    remove_column :users, :adress_name
    remove_column :users, :phonenumber
    remove_column :users, :delete_at
    remove_column :users, :birthday
  end
end

class AddAToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname ,:string
    add_column :users, :family_name ,:string
    add_column :users, :first_name ,:string
    add_column :users, :family_name_kana ,:string
    add_column :users, :first_name_kana ,:string
    add_column :users, :birthday ,:date
    add_column :users, :phonenumber ,:integer
    add_column :users, :image ,:string
    add_column :users, :profile ,:text
    add_column :users, :status ,:integer
    add_column :users, :delete_at ,:datetime
  end
end

class RemovePhonenumberToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :phonenumber
  end
end

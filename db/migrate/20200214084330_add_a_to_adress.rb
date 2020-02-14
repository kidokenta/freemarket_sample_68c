class AddAToAdress < ActiveRecord::Migration[5.2]
  def change
    add_column :adresses, :user_id ,:integer
  end
end

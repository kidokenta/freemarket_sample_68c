class RemoveAToItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :buyer_user_id
  end
end

class AddBuyToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :buyer_user_id , :integer
  end
end

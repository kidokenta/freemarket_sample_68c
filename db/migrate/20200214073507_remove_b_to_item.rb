class RemoveBToItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :item_name
    remove_column :items, :item_explain
    remove_column :items, :category_id
    remove_column :items, :brand_id
    remove_column :items, :condition
    remove_column :items, :shipping_fee
    remove_column :items, :shipping_days
    remove_column :items, :shipping_company
    remove_column :items, :shipping_region
    remove_column :items, :price
    remove_column :items, :seller_user_id
    remove_column :items, :item_size
    remove_column :items, :images
  end
end

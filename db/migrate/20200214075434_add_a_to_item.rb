class AddAToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :name ,:string
    add_column :items, :explain ,:text
    add_column :items, :category_id ,:integer
    add_column :items, :brand_id ,:integer
    add_column :items, :status ,:integer
    add_column :items, :condition ,:integer
    add_column :items, :shipping_fee ,:integer
    add_column :items, :shipping_days ,:integer
    add_column :items, :shipping_company ,:integer
    add_column :items, :shipping_region ,:string
    add_column :items, :price ,:integer
    add_column :items, :size ,:string
    add_column :items, :seller_user_id ,:integer
  end
end

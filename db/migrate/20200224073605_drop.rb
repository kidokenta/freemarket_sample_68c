class Drop < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :brand_id 
    remove_column :items, :shipping_company 
    add_column :items, :brand  ,:string
  end
end

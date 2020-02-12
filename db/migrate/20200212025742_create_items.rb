class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name             ,null: false
      t.string :imeges                ,null: false
      t.string :item_explain          ,null: false
      t.integer :category_id
      t.integer :brand_id
      t.integer :condition            ,null: false
      t.integer :shipping_fee         ,null: false
      t.integer :shipping_days        ,null: false
      t.integer :shipping_company     
      t.integer :region               ,null: false
      t.integer :price                ,null: false
      t.integer :seller_user_id       ,null: false
      t.integer :buyer_user_id
      t.timestamps
    end
  end
end

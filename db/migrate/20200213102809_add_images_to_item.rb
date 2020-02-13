class AddImagesToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :imeges , :text
    add_column :items, :item_size , :string
    add_column :items, :shipping_region , :string
  end
end

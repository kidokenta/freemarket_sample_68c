class AddImegesToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :images , :text
  end
end

add_column :images, :image , :text, null: false
add_column :images, :item_id , :integer, null: false

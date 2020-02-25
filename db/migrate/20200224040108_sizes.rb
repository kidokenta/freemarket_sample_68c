class Sizes < ActiveRecord::Migration[5.2]
  def change
    # drop_table :size
    drop_table :items_sizes
    drop_table :category_sizes
  end
end

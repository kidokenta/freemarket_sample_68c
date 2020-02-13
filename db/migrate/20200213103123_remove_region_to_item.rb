class RemoveRegionToItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :region
  end
end

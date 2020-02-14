class RemoveImagesToItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :imeges
  end
end

class RemoveImageToImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :image
  end
end

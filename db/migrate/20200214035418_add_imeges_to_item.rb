class AddImegesToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :images , :text
  end
end

class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.integer :prefecture_id
      t.string :city

      t.timestamps
    end
  end
end

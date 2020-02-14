class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.integer :postal_code,      null: false
      t.string :prefecture,      null: false
      t.string :town,      null: false
      t.string :number,      null: false
      t.string :name,      null: false
      t.timestamps
    end
  end
end

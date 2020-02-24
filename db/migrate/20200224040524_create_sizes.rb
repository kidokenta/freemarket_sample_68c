class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :size
      t.string :ancestry
      t.timestamps
    end
  end
end

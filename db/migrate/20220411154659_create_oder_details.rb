class CreateOderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :oder_details do |t|
      t.integer :price
      t.integer :quantity
      t.integer :making_status

      t.timestamps
    end
  end
end

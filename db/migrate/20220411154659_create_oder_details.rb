class CreateOderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :oder_details do |t|
      t.integer :price
      t.integer :quantity
      t.integer :making_status
      t.integer :item_id
      t.integer :order_id

      t.timestamps
    end
  end
end

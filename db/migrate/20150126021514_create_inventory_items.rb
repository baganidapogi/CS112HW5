class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.integer :item_id
      t.integer :quantity

      t.timestamps
    end
  end
end

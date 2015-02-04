class CreateInventoryTransactions < ActiveRecord::Migration
  def change
    create_table :inventory_transactions do |t|
      t.date :transacted_at
      t.integer :inventory_item_id
      t.integer :quantity
      t.string :transaction_type

      t.timestamps
    end
  end
end

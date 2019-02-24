class CreateItemTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :item_trades do |t|
      t.integer :name
      t.float :value
      t.integer :quantity

      t.timestamps
    end
  end
end

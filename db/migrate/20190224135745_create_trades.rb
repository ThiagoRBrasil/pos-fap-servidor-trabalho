class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.string :consumerName

      t.timestamps
    end
  end
end

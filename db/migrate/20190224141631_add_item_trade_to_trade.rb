class AddItemTradeToTrade < ActiveRecord::Migration[5.2]
  def change
  		add_reference :item_trades, :trade, index: true
  end
end

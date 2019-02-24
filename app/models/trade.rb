class Trade < ApplicationRecord
	validates :consumerName, presence: true

	has_many :item_trades

	def has_nil_fields?
		self.consumerName.nil?
	end

	def orderByValue

		array = []
		self.each do |trade|
			valorTotal = 0
			trade.item_trades.each do |valorTrader|
				valorTotal = valorTotal + valorTrader.value
			end
			array.push({:consumerName => trade.consumerName, :total => valorTotal})
		end

		array.sort_by { |h | -h[:total] }
	end

	def orderByQuantity

	end
end

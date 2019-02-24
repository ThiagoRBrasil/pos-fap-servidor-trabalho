class Trade < ApplicationRecord
	validates :consumerName, presence: true

	has_many :item_trade

	def has_nil_fields?
		self.consumerName.nil?
	end
end

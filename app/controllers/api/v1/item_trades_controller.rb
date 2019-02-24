class Api::V1::ItemTradesController < ApplicationController
	before_action :find_itemTrade, only: [:destroy]

	def index
		itemTrade = ItemTrade.where trade_id: params[:trade_id]
		render json: itemTrade, status: :ok
	end

	def create
		item = ItemTrade.new (itemTrade_params)

		if itemTrade.save 
			render json: itemTrade, status: :created and return
		elsif itemTrade.has_nil_fields?
			error_status = :bad_request
		else
			error_status = :unprocessable_entity
		end

		render json: {message: 'Item Trade not saved', errors: itemTrade.errors}, status: error_status
	end

	def destroy
		@itemTrade.destroy
	end

	def show
		itemTrade = ItemTrade.find_by trade_id: params[:trade_id]

		if itemTrade.nil?
			render json: {message: "Item Trade not found"}, status: :not_found
		else
			render json: itemTrade, status: :ok	
		end
	end

	private
	def find_itemTrade
		@itemTrade = ItemTrade.find_by_id(params[:id])
		if @itemTrade.nil?
			render json: {message: "Item Trade not found"}, status: :not_found and return
		end
	end

	def itemTrade_params
		params.permit(:name, :value, :quantity, :trade_id)
	end

end

class Api::V1::TradesController < ApplicationController
	before_action :find_trade, only: [:show, :update, :destroy]

	def index
		render json: Trade.all, status: :ok
	end

	def show
		render json: @trade, status: :ok
	end

	def create
		trade = Trade.new trade_params

		if trade.save
			render json: trade, status: :created and return
		elsif trade.has_nil_fields?
			error_status = :bad_request
		else
			error_status = :unprocessable_entity
		end

		render json: {message: 'Trade not saved', errors: trade.errors}, status: error_status
	end

	def update
		if @trade.update (trade_params)
			render json: @trade, status: :ok and return
		elsif @trade.has_nil_fields?
			error_status = :bad_request
		elsif
			error_status = :unprocessable_entity
		end

		render json: {message: 'Trade not updated', errors: @trade.errors}, status: error_status
	end

	def destroy
		@trade.destroy
	end

	private
	def find_trade
		@trade = Trade.find_by_id(params[:id])
		if @trade.nil?
			render json: {message: "Trade not found"}, status: :not_found and return
		end
	end

	def trade_params
		params.permit(:consumerName)
	end

end

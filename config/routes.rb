Rails.application.routes.draw do

	namespace :api do
		namespace :v1 do
			get "vendagasto", to: "trades#orderByGasto"
			get "vendaquantidade", to: "trades#orderByQtd"
			resources :trades do
				#put "item_trades/:id", to: "item_trades#update"
				resources :item_trades
			end

		end
	end

end

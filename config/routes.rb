Rails.application.routes.draw do

	namespace :api do
		namespace :v1 do

			resources :trades do
				resources :item_trades
			end
			
		end
	end

end

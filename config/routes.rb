Rails.application.routes.draw do
	resources :orders
	resources :schedules

	resources :api do
	  member do
	    get :createOrder
	  end
	 end

  root 'home#index'
end

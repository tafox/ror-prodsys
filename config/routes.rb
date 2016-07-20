Rails.application.routes.draw do
  resources :labours
  resources :labour_availabilities
  resources :schedules
  resources :raw_material_products
	resources :orders
	resources :schedules
  resources :products

  root 'home#index'

  scope '/api' do
    scope '/external' do
      get '/createOrder' => 'api#create'
      get '/viewOrder' => 'api#view'
    end
  end
end

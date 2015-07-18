Rails.application.routes.draw do


  

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  ActiveAdmin.routes(self)

  
  	devise_for :users
	resources :users, only: [:update, :show, :index]

	resources :products do
		resources :feedbacks

		member do
			get'copy'
		end	
	end	
	get'/products-all' => 'products#index_all'

 	get 'welcome/about'
	root to: 'welcome#index'
end

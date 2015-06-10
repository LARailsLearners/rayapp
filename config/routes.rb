Rails.application.routes.draw do


  	devise_for :users
	resources :users, only: [:update, :show, :index]

	resources :products do
		member do
			get'copy'
		end	
	end	

 	get 'welcome/about'
	root to: 'welcome#index'
end

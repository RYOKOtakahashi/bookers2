Rails.application.routes.draw do
	devise_for :users
	devise_for :books
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	root 'users#top'
  	get '/about' => 'users#about'
  	# get '/books' => 'users#books'

  	resources :users, only: [:index, :new, :show, :edit, :update, :destroy]
  	resources :books
end

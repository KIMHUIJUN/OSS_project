Rails.application.routes.draw do
  resources :tracks
  resources :albums
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get 'albums/:album_id/show_albums', to: 'albums#show', as: :album_show
	
	root 'home#index'
end

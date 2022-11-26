Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks'}
  get 'register/info1'
  get 'register/info2'
  get 'visitor/main'
  resources :tracks
  resources :albums
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get 'albums/:album_id/show_albums', to: 'albums#show', as: :album_show
	
	root 'home#index'
end

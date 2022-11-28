Rails.application.routes.draw do
  resources :commends
  devise_for :users ,:controllers => { omniauth_callbacks: 'user/omniauth_callbacks'}
  
  get 'home/index', to: 'home#index', as: :home
  resources :tracks
  resources :albums
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get 'albums/:album_id/show_albums', to: 'albums#show', as: :album_show
	match '/profile/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
	root 'home#index'
end

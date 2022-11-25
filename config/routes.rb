Rails.application.routes.draw do
  get 'register/info1'
  get 'register/info2'
  get 'visitor/main'
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }
  resources :tracks
  resources :albums
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get 'welcome/index', to: 'welcome#index'
  
	get 'albums/:album_id/show_albums', to: 'albums#show', as: :album_show
	root 'artists#index'
end

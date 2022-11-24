Rails.application.routes.draw do
  resources :videos
  resources :tracks
  resources :albums
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get 'albums/:album_id/show_albums', to: 'albums#show', as: :album_show
	get 'auth/kakao/callback', to: 'auth#kakao'
	root 'albums#index'
end

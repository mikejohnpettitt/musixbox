Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :sessions, only:[:create]
  resources :playlists, only:[:index]


end

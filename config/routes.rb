Rails.application.routes.draw do
  get 'questions/show'
  devise_for :users
  root to: "pages#home"

  resources :playlists, only:[:index]
  resources :questions, only:[:create, :show]

  resources :sessions, only:[:create, :new]
  # below, , as: :play_sessions, path: "play_sessions" is added because otherwise it conflicts with devise
  resources :user_sessions, only:[:show], as: :play_sessions, path: "play_sessions" do
    member do
      get :results  # ✅ Cette ligne ajoute la route results
    end
  end
  post "update_song_count", to: "sessions#update_count"
  get "test_results", to: "pages#test_results"
  post "photos", to: "photos#create"


end

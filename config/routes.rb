Rails.application.routes.draw do
  # get 'camera/show'
  get 'questions/show'
  devise_for :users
  root to: "pages#home"


  resources :playlists, only:[:index]
  resources :questions, only:[:create, :show, :edit, :update]

  resources :sessions, only:[:create, :new]
  # below, , as: :play_sessions, path: "play_sessions" is added because otherwise it conflicts with devise
  resources :user_sessions, only:[:show], as: :play_sessions, path: "play_sessions" do
    member do
      get :results  # ✅ Cette ligne ajoute la route results
      get :share_card         # nouvelle route pour la création de la share_card.

    end
  end
  post "update_song_count", to: "sessions#update_count"



  get "play_sessions/:id/results", to: "user_sessions#results", as: "play_session_results"
  get "play_sessions/:id/results/share", to: "user_sessions#share", as: "play_session_results_share"

  resources :groups, only:[:show, :create, :new]

end

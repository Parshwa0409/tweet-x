Rails.application.routes.draw do
  # HOME - ROOT
  root "home#index"

  # USER CONTROLLER
  get 'search', to: "user#search"
  post 'search', to: "user#search_user"
  
  get 'profile', to: "user#profile"

  post 'add_following', to: 'user#add_user'
  
  get 'add_tweet', to: 'user#add_tweet'
  post 'create_tweet', to: 'user#create_tweet'



  # SIGN-UP
  get "sign_up", to:"registration#new"
  post "sign_up", to:"registration#create"

  # SIGN-IN
  get "sign_in", to:"session#new"
  post "sign_in", to:"session#create"
  
  # LOGOUT
  delete 'logout', to: 'session#destroy'

  get "up" => "rails/health#show", as: :rails_health_check
end

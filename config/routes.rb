Rails.application.routes.draw do
  # HOME - ROOT
  root "home#index"


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

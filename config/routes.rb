Rails.application.routes.draw do
  devise_for :users
  root to: "memories#index"
  resources :memories
end

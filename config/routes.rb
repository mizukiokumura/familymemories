Rails.application.routes.draw do
  devise_for :users
  root to: "memories#index"
  resources :memories do
    collection do
      get 'search'
    end
    resources :comments,  only: :create
  end
end

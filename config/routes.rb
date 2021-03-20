Rails.application.routes.draw do
  devise_for :users
  resources :users ,only:[:edit,:update]
  root to:"prototypes#index"
  resources :prototypes, only:[:index,:new,:create,:edit,:update,:show,:destroy] do
    resources :comments ,only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
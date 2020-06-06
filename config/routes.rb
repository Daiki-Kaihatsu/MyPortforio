Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  devise_scope :user do
  post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  resources :users
  resources :boards do
    resource :favorites, only: [:create,:destroy]
    get :search, on: :collection
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

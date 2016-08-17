Rails.application.routes.draw do

  get 'dashboard' => 'users#dashboard', as: "user_dashboard"

  get 'profile' => 'users#show', as: "user_profile"

  get 'conversations/index'

  get 'conversations/show'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    root to: 'pages#home'

  resources :cellars, only: [:index, :show, :create, :update, :destroy] do
    resources :reservations, only: [:create, :new, :destroy]
    resources :messages, only: [:create, :new]
    resources :conversations, only: [:index, :show]
  end
  namespace :admin do
    resources :bottle_lots, only: [:new, :index, :create, :show]
    resources :cellars, only: [:new, :index, :edit]
    resources :reservations, only: [:index]
    resources :conversations, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

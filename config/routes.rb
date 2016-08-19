Rails.application.routes.draw do

  get 'dashboard' => 'users#dashboard', as: "user_dashboard"

  get 'profile/:id' => 'users#show', as: "user_profile"

  resources :conversations, only: [:index, :show] do
    resources :messages, only: [:create]
  end


  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    root to: 'pages#home'

  resources :cellars, only: [:index, :show, :create, :update, :destroy] do
    resources :reservations, only: [:create, :new, :show, :destroy]
    resources :messages, only: [:create, :new, :index]
  end

  resources :reservations, only: [] do
    resources :reservation_bottles, only: [:create, :show, :destroy]
  end

  namespace :admin do
    resources :bottle_lots, only: [:new, :index, :create, :show]
    resources :cellars, only: [:new, :index, :edit]
    resources :reservations, only: [:index, :show]
  end

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

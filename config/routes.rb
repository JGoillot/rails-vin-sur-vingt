Rails.application.routes.draw do
  get 'conversations/index'

  get 'conversations/show'

  devise_for :users
  root to: 'pages#home'

  resources :cellars do
    resources :reservations, only: [:create, :new, :destroy]
    resources :messages, only: [:create, :new]
    resources :conversations, only: [:index, :show]
  end
  resources :bottles, only: [:new, :index, :create, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

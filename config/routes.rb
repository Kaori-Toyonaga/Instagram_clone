Rails.application.routes.draw do
  root to: 'users#new'
  resources :contacts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:index, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

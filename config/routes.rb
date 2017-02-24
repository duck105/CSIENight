Rails.application.routes.draw do
  namespace :admin do
    resources :infors
    resources :categories
    resources :questions
    resources :options
    resources :users
    resources :submissions
    resources :judges
    resources :tokens
    resources :token_judges
    root to: "users#index"
  end

  devise_for :users, controllers: { registrations: "users/registrations" , omniauth_callbacks: "users/omniauth_callbacks", sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions , only: [:index, :show] do
    resources :submissions
    resources :options
  end
  resources :categories
  resources :infors
  resources :tokens , only: [:index]
  post 'token', to: "tokens#result", as: :result

  get '/about', to: "static_pages#about", as: :static_about
  get '/play', to: "static_pages#play",  as: :static_play

  get 'rank/index'

  root "infors#index"

end

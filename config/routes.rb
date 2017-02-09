Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" , omniauth_callbacks: "users/omniauth_callbacks", sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  resources :questions do
  	resources :submissions
  	resources :options
  end	
  resources :categories
  resources :infors
  
  get 'rank/index'

  root "infors#index"

end

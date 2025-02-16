Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  resources :articles

  get '/signup', to: 'users#new'
  get '/edit-profile', to: 'users#edit'
  resources :users, except: [:new]
  # post '/signup', to: 'users#create'
  # get "/sign_up", controller: "users", action: :sign_in
end

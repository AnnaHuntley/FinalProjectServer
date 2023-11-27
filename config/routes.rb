Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
      post 'signup', to: 'registrations#create'
    end
  end

  devise_for :users

  resources :achievements
  resources :bucket_lists
  resources :memories

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

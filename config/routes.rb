Rails.application.routes.draw do
  get 'welcome/index'
  devise_scope :user do
    namespace :api do
      namespace :v1 do
        post 'login', to: 'sessions#create'
        post 'signup', to: 'registrations#create'
      end
    end
  end

  devise_for :users

  resources :achievements
  resources :bucket_lists
  resources :memories, defaults: { format: :json }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
  # root "articles#index"
end

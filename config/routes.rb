Rails.application.routes.draw do
  resources :books do
    resources :reviews
  end
  # root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # monitoring console
  mount Sidekiq::Web => "/sidekiq" if defined?(Sidekiq)

  # Defines the root path route ("/")
  root 'books#index'
end

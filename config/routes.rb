Rails.application.routes.draw do
  get 'home_pages/index'
  root 'home_pages#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

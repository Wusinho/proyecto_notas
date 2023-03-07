Rails.application.routes.draw do
  devise_for :users
  root 'home_pages#index'
  resources :notes, except: %i[destroy new]
  resources :home_pages, only: %i[index show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

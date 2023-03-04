Rails.application.routes.draw do
  devise_for :users
  get 'home_pages/index'
  root 'home_pages#index'
  resources :notes do
    get :title_order, on: :collection
    get :note_date_order, on: :collection
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  devise_for :users
  get 'home_pages/index'
  root 'home_pages#index'
  resources :notes, only: [:index, :show, :create, :edit, :update] do
    get :note_card, on: :member
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

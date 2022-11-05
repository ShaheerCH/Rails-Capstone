Rails.application.routes.draw do

  root 'groups#index'

  get 'login', to: 'splash#index'

  devise_for :users

  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end

  resources :groups, only:[:index, :create, :new] do
    resources :entities, only:[:index, :new, :create, :index]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

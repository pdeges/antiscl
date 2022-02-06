Rails.application.routes.draw do
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  #post 'logout' => 'user_sessions#destroy'
  get 'logout' => 'user_sessions#destroy', :as => :logout
  get "posts" => "posts#index", :as => :home
  resources :users do
    resources :posts do
      resources :comments
    end
  end
  resources :comments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#new"
end

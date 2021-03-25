Rails.application.routes.draw do
  #get "todos", to: "todos#index"
  #get "todos/:id", to: "todos#show"
  
  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  
  resources :todos
  resources :users
end

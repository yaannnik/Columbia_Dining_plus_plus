# Columbia_dining_plus_plus::Application.routes.draw do
#   resources :dishes
#   # map '/' to be a redirect to '/movies'
#   root :to => redirect('/dishes')
# end

Columbia_dining_plus_plus::Application.routes.draw do
  
  # map '/' to be a redirect to '/movies'

  resources :dishes
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :sessions, only: [:new, :create, :edit, :update, :show, :destroy]

  root :to => redirect('/login')
  # dish :to => redirect('/dishes')

  get "/login", to: "sessions#show"
  get "/new", to: "users#new"

  # get "/logout", to: "sessions#destroy"
  # post "/logout", to: "sessions#destroy"
end

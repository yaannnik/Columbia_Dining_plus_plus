Columbia_dining_plus_plus::Application.routes.draw do
  resources :dishes
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/dishes')
end

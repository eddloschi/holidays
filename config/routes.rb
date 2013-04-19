Holidays::Application.routes.draw do

  resources :holidays, only:[:index]

  root :to => "home#index"
  match "/*path" => "home#index"
end

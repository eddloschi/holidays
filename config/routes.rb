Holidays::Application.routes.draw do

  match '/holidays/:ym' => 'holidays#index', constraints: { :ym => /\d{4}-\d{2}/ }

  root :to => "home#index"
  match "/*path" => "home#index"
end

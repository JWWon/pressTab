Rails.application.routes.draw do
  root "landing#index"

  get '/' => "landing#index"
  get '/rule' => "landing#rule"
  post '/write' => "landing#write"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
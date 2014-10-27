Rails.application.routes.draw do

root 'pages#index'
get '/about' => 'pages#about'
get '/browse_global' => 'pages#browse_global'
get '/friends' => 'pages#friends'

get 'login' => 'session#new'
post 'login' => 'session#create'
delete 'login' => 'session#destroy', :as => 'logout'

get '/sign_up' => 'users#new'
post 'sign_up' => 'users#create'

get '/manage_lists' => 'lists#index'

resources :lists


end

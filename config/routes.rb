Rails.application.routes.draw do

  root 'pages#index'
  get '/about' => 'pages#about'
  get '/browse_global' => 'pages#browse_global'
  get '/friends' => 'pages#friends'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy', :as => 'logout'

  get '/sign_up' => 'users#new'
  post '/sign_up' => 'users#create'

  get '/manage_lists' => 'lists#index'

  # resources :users do
    resources :lists
  resources :goals
end
#         Prefix Verb   URI Pattern                              Controller#Action
#           root GET    /                                        pages#index
#          about GET    /about(.:format)                         pages#about
#  browse_global GET    /browse_global(.:format)                 pages#browse_global
#        friends GET    /friends(.:format)                       pages#friends
#          login GET    /login(.:format)                         session#new
#                POST   /login(.:format)                         session#create
#         logout DELETE /login(.:format)                         session#destroy
#        sign_up GET    /sign_up(.:format)                       users#new
#                POST   /sign_up(.:format)                       users#create
#   manage_lists GET    /manage_lists(.:format)                  lists#index
#     list_goals GET    /lists/:list_id/goals(.:format)          goals#index
#                POST   /lists/:list_id/goals(.:format)          goals#create
#  new_list_goal GET    /lists/:list_id/goals/new(.:format)      goals#new
# edit_list_goal GET    /lists/:list_id/goals/:id/edit(.:format) goals#edit
#      list_goal GET    /lists/:list_id/goals/:id(.:format)      goals#show
#                PATCH  /lists/:list_id/goals/:id(.:format)      goals#update
#                PUT    /lists/:list_id/goals/:id(.:format)      goals#update
#                DELETE /lists/:list_id/goals/:id(.:format)      goals#destroy
#          lists GET    /lists(.:format)                         lists#index
#                POST   /lists(.:format)                         lists#create
#       new_list GET    /lists/new(.:format)                     lists#new
#      edit_list GET    /lists/:id/edit(.:format)                lists#edit
#           list GET    /lists/:id(.:format)                     lists#show
#                PATCH  /lists/:id(.:format)                     lists#update
#                PUT    /lists/:id(.:format)                     lists#update
#                DELETE /lists/:id(.:format)                     lists#destroy

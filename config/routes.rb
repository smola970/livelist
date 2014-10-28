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


  resources :lists
  resources :goals
  resources :users

  get '/goals/:id/completed' => 'goals#completed_edit'
  post '/goals/:id/completed' => 'goals#completed_update' , as: 'completed_update'
end
#           Prefix Verb   URI Pattern                    Controller#Action
#             root GET    /                              pages#index
#            about GET    /about(.:format)               pages#about
#    browse_global GET    /browse_global(.:format)       pages#browse_global
#          friends GET    /friends(.:format)             pages#friends
#            login GET    /login(.:format)               session#new
#                  POST   /login(.:format)               session#create
#           logout DELETE /login(.:format)               session#destroy
#          sign_up GET    /sign_up(.:format)             users#new
#                  POST   /sign_up(.:format)             users#create
#     manage_lists GET    /manage_lists(.:format)        lists#index
#            users GET    /users(.:format)               users#index
#                  POST   /users(.:format)               users#create
#         new_user GET    /users/new(.:format)           users#new
#        edit_user GET    /users/:id/edit(.:format)      users#edit
#             user GET    /users/:id(.:format)           users#show
#                  PATCH  /users/:id(.:format)           users#update
#                  PUT    /users/:id(.:format)           users#update
#                  DELETE /users/:id(.:format)           users#destroy
#            lists GET    /lists(.:format)               lists#index
#                  POST   /lists(.:format)               lists#create
#         new_list GET    /lists/new(.:format)           lists#new
#        edit_list GET    /lists/:id/edit(.:format)      lists#edit
#             list GET    /lists/:id(.:format)           lists#show
#                  PATCH  /lists/:id(.:format)           lists#update
#                  PUT    /lists/:id(.:format)           lists#update
#                  DELETE /lists/:id(.:format)           lists#destroy
#            goals GET    /goals(.:format)               goals#index
#                  POST   /goals(.:format)               goals#create
#         new_goal GET    /goals/new(.:format)           goals#new
#        edit_goal GET    /goals/:id/edit(.:format)      goals#edit
#             goal GET    /goals/:id(.:format)           goals#show
#                  PATCH  /goals/:id(.:format)           goals#update
#                  PUT    /goals/:id(.:format)           goals#update
#                  DELETE /goals/:id(.:format)           goals#destroy
#                  GET    /goals/:id/completed(.:format) goals#completed_edit
# completed_update POST   /goals/:id/completed(.:format) goals#completed_update
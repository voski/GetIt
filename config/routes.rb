Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index]
  resources :goals
  resources :comments, only: [:create, :destroy]

  root 'users#index'

end

#
# Prefix Verb   URI Pattern               Controller#Action
# session POST   /session(.:format)        sessions#create
# new_session GET    /session/new(.:format)    sessions#new
#        DELETE /session(.:format)        sessions#destroy
#  users GET    /users(.:format)          users#index
#        POST   /users(.:format)          users#create
# new_user GET    /users/new(.:format)      users#new
#   user GET    /users/:id(.:format)      users#show
#  goals GET    /goals(.:format)          goals#index
#        POST   /goals(.:format)          goals#create
# new_goal GET    /goals/new(.:format)      goals#new
# edit_goal GET    /goals/:id/edit(.:format) goals#edit
#   goal GET    /goals/:id(.:format)      goals#show
#        PATCH  /goals/:id(.:format)      goals#update
#        PUT    /goals/:id(.:format)      goals#update
#        DELETE /goals/:id(.:format)      goals#destroy

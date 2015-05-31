Rails.application.routes.draw do
  root to: 'static_pages#home'

  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/sign_in',   to: 'sessions#new', as: "new_session"
  get '/sign_up', to: 'users#new',    as: "new_user"

  get '/groups/:id/members', to: 'groups#members'

  patch '/groups/:id/activate', to: 'users#set_activate_group', as: "activate_group"


  resources :users, except: [:new]
  resources :groups
  resource :session, only: [:create, :destroy]
  resources :organizations
  resources :listings


  resources :memberships, only: [:create, :destroy]
end

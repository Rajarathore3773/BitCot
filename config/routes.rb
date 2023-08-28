Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  
  resources :events do
    member do
      post :archive
      post :unarchive
   end
    resources :likes, only: [:create, :destroy]
    resources :dislikes, only: [:create, :destroy]
    resources :comments, only: [:create, :show, :destroy]
  end

  #get "/events/:id/comments" , to: "comments#show"

  
  #root  "home#index"
  root  'events#index'

  get 'users', to: 'users#index'

  get 'search_events', to: 'events#search_events'
  get 'list_my_created_events', to: 'events#my_created_events'

  get 'my_created_events', to: 'events#index', as: :user_created_events

  get 'list_all_events', to: 'events#list_all_events', as: :list_all_events

  #get 'list_users_with_events', to: 'users#list_users_with_events', as: :list_users_with_events

  get 'events/autocomplete', to: 'events#autocomplete'



end

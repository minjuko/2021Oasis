Rails.application.routes.draw do
  root :to => "rides#index"
  get 'history/collect' => 'history#collect'
  get 'history/full' => 'history#full'
  get 'history/complete' => 'history#complete'
  get 'chats/list' => 'chats#list'
  get 'chats/a' => 'chats#a'
  get 'chats/b' => 'chats#b'
  get 'chats/c' => 'chats#c'
  get 'rides/:ride_id/comments/destroy/:id' => 'comments#destroy'
  get 'rides/:ride_id/comments/swap/:id' => 'comments#swap'
  get 'users/show'
  get 'users/index'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :rides
  resources :rides do
    resources :comments
  end
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

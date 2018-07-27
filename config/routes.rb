Rails.application.routes.draw do
  resources :articles
  resources :tags
  resources :authors
  resources :author_sessions, only: [ :new, :create, :destroy ]
  resources :taggings
  root 'authors#index'
  
  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
  get '/taggings/:article_id/:tag_id' => 'taggings#destroy'
end

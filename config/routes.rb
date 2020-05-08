Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'casa#index
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:show, :edit, :update, :create]
  get '/blog', to: 'blog#index'
  get '/blog/:id', to: 'blog#show'
  get '/lexique', to: 'lessicu#index'
  get '/lessicu', to: 'lessicu#cor'
  get '/lessicu/:id', to: 'lessicu#show'
  scope :admin do
    get "/", to: 'articles#index'
    get '/search', to: 'casa#search'
    get '/circa', to: 'casa#circa'
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :words
    resources :articles
    resources :themes
    resources :categories
  end
end
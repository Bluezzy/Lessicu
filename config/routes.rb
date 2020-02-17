Rails.application.routes.draw do
  root 'casa#index'
  get 'search', to: 'casa#search'
  get '/blog', to: 'blog#index'
  get '/blog/:id', to: 'blog#show'
  get '/lessicu', to: 'lessicu#index'
  get '/lessicu/:id', to: 'lessicu#show'
  scope :admin do
    get "/", to: 'admin#index'
    resources :words
    resources :articles
    resources :themes
  end
end
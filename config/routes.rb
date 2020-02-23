Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'casa#index'
  get 'search', to: 'casa#search'
  get 'circa', to: 'casa#circa'
  get '/blog', to: 'blog#index'
  get '/blog/:id', to: 'blog#show'
  get '/lexique', to: 'lessicu#index'
  get '/lessicu', to: 'lessicu#cor'
  get '/lessicu/:id', to: 'lessicu#show'
  scope :admin do
    get "/", to: 'admin#index'
    resources :words
    resources :articles
    resources :themes
  end
end
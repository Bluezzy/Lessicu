Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root 'articles#index'

  get '/search', to: 'glossary#search'
  get '/circa', to: 'glossary#circa'

  get '/signup', to: 'users#new'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  get '/lessicu', to: 'lessicu#cor'
  get '/lexique', to: 'lessicu#fr'

  resources :articles
  resources :users, only: [:show, :edit, :update]

  scope :admin do
    get '', to: 'admin#index'
    resources :users, except: [:show, :edit, :update]
    resources :words
    resources :themes
    resources :categories
  end
end
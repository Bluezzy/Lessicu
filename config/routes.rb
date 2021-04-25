Rails.application.routes.draw do
  root 'articles#index'

  get '/search', to: 'glossary#search'
  get '/circa', to: 'glossary#circa'

  get '/signup', to: 'users#new'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  get '/gestion', to: 'admin#index'

  get '/lessicu', to: 'lessicu#cor'
  get '/lexique', to: 'lessicu#fr'

  resources :articles
  resources :users, only: [:show, :edit, :update, :destroy]

  scope :admin do
    get '', to: 'admin#index'
    get '/brouillons', to: 'articles#drafts'
    post '/publish', to: 'articles#publish'
    resources :users, except: [:show, :edit, :update, :destroy]
    resources :words
    resources :themes
    resources :categories
  end
end
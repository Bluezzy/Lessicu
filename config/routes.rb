Rails.application.routes.draw do
  root 'casa#index'
  get 'search', to: 'casa#search'
  scope :admin do
    resources :words
    resources :articles
  end
end
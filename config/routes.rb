Rails.application.routes.draw do
  root 'casa#index'
  get 'json', to: 'casa#json'
  scope :admin do
    resources :words
    resources :articles
  end
end
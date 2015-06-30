JhuproWebsite::Application.routes.draw do
  root to: 'static_pages#home'
  get '/about',   to: 'static_pages#about'
  get '/careers',   to: 'static_pages#career'
  resources :contacts, only: [:new, :create]
end
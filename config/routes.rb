Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :registrations], controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}

  root 'dashboards#index'

  resources :categories
  resources :movies
  resources :ratings
end

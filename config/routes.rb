Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'items#index'
  resources :items do
    resources :comments
  end
  resources :orders
  resources :questions
end

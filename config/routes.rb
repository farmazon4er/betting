require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => "/sidekiq"
  devise_for :users
  root "dashboard#index" 
 
  post "users/restore", to: "users#restore_balance"
end

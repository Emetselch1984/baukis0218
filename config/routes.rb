Rails.application.routes.draw do
  namespace :staff,path: "" do
    root'top#index'
    get "login",to:"sessions#new", as: :login
    post "session",to:"sessions#create", as: :session
    delete "session",to:"sessions#destroy"
    resource :account
    resources :profile
  end
  namespace :admin do
    root'top#index'
    get "login",to:"sessions#new", as: :login
    post "session",to:"sessions#create", as: :session
    delete "session",to:"sessions#destroy"
    resources :staff_members
    resources :profile
  end
  namespace :customer do
    root'top#index'
    get "login",to:"sessions#new", as: :login
    post "session",to:"sessions#create", as: :session
    delete "session",to:"sessions#destroy"

  end
end

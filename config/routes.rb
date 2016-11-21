Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  localized do
    root 'homepage#index'
    post '/listings/contact', to: 'listings#contact', as: 'listing_contact'
    resources :listings, only: [:index, :show, :new]
    devise_for :users

    namespace :account do
      resources :contacts
      resources :users
      resources :messages
      resources :comments
    end
  end
end

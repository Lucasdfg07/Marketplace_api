Rails.application.routes.draw do
  devise_for :users
  
  namespace :api, defaults: {format: :json} do
    devise_scope :user do
      post "sign_up", to: "users/registrations#create"
      post "sign_in", to: "users/sessions#create"
    end
  end

  namespace :api do
    resources :address
    resources :category
    resources :order
    resources :product
    resources :sale
  end
end

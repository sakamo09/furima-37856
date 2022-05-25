Rails.application.routes.draw do
  devise_for :users
  root to: "product_informations#index"
  resources :product_informations 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

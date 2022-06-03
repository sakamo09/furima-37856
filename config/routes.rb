Rails.application.routes.draw do
  devise_for :users
  root to: "product_informations#index"
  resources :product_informations 

  resources :product_informations do
    resources :purchase_records, only: [:index, :create]
  end
 
end

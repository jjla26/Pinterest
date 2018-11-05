Rails.application.routes.draw do
  devise_for :users
  get 'products/index'
  get 'mypins'  => 'pins#mypins'
  get 'pinsof/:user_id'  => 'pins#pinsof', :as => 'pinsof'
  resources :pins
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

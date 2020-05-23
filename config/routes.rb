Rails.application.routes.draw do
  resources :albums, only: [:index]
  resources :users, only: [:index, :show, :create] do
    resources :albums, only: [:create, :show, :update]
  end
end
  # namespace :auth do
  #   resources :users
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


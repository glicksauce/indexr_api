Rails.application.routes.draw do
  resources :albums, only: [:index, :show]
  resources :users, only: [:index, :show] do
    resources :albums, only: [:create]
  end
end
  # namespace :auth do
  #   resources :users
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


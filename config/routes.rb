Rails.application.routes.draw do
  devise_for :users
  root          'messages#index'          #ルートパスの指定
  resources :users, only: [:edit, :update]
end

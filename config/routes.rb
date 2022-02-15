Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :board, only: [:show, :update]
  resources :lists
  resources :cards do
    resources :attachments, only: :destroy
    resources :comments
    resources :tasks
  end

  root to: 'boards#show'
end

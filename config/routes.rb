Rails.application.routes.draw do

  resources :members, only: [:show, :new, :create]

  resources :submissions, only: [:show] do
    resource :activities, only: [:show, :update, :new, :create]
    resource :details, only: [:show, :update]
  end

  resources :recommendations, only: :show
  resources :recommendations_test, only: :show

  namespace :admin do
    root to: redirect('admin/members')
    resources :members, only: [:index, :create, :show]
    resources :archived_members, only: [:index, :show]
    resources :activities, only: [:show]
  end

  resources :pages, only: :show
  root to: 'pages#index'
end

Rails.application.routes.draw do
  resources :dashboard, only: :index
  root 'employees#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :employees, except: :show do
    resources :profiles
    resources :articles, only: %i[index new create]
  end
end

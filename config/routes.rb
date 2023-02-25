Rails.application.routes.draw do
  get 'reports/index'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get 'main/index'
  get '/operations', to: 'operations#display'
  
  resources :categories do
    resources :operations, only: [:show, :edit, :update, :destroy, :index]
  end

  resources :operations, only: [:new, :create]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "main#index"
end

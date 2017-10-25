Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :registered_applications

  get 'welcome/about'

  root 'registered_applications#index'

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

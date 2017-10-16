Rails.application.routes.draw do
  # resources :registered_applications
  devise_for :users, controllers: { confirmations: 'confirmations' }
  # resources :registered_applications,
  resources :applications, controller: 'registered_applications'

  get 'welcome/about'

  root 'registered_applications#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

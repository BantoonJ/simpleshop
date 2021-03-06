Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/login',
               sign_out: 'api/logout',
               registration: 'api/signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations',
               confirmations: 'confirmations'
  }

  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :users, only: %w[show] do
      resources :addresses
      resources :orders
    end
    resources :regions do
      resources :products
    end
  end
end

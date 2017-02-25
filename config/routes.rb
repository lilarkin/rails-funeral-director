Rails.application.routes.draw do
  devise_for :users, controllers: {
   registrations: 'users/registrations',
   omniauth_callbacks: 'users/omniauth_callbacks'
   }

  root 'home#index'

  resources :mortuary do
    resources :deceased
  end

  resources :deceased do
    resources :funeral
  end
end

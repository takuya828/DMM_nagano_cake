Rails.application.routes.draw do
  # devise_for :customers
  # devise_for :admins

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
     resources :genres, only: [:new, :index, :create, :edit, :update]
     resources :items
  end

end

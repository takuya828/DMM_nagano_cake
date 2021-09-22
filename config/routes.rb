Rails.application.routes.draw do
  # get 'customers/show'
  # resources :customers, only: [:show]
  # devise_for :customers
  # devise_for :admins

  get '/customers/mypage', to: 'customers#show'
  get '/customers/check', to: 'customers#check'
  patch '/customers/:id/quit' => 'customers#quit', as: 'quit'
  resources :customers, only: [:edit, :update]
  resources :addresses, only: [:index, :edit, :new, :create, :update, :destroy, :update]
  delete '/addresses/:id/delete' => 'addresses#delete', as:'address_delete'
  resources :items, only: [:index, :show]

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
  get 'home/about' => 'homes#about', as:'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
     resources :genres, only: [:new, :index, :create, :edit, :update]
     resources :items
     resources :customers
  end

end

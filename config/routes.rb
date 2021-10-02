Rails.application.routes.draw do
  # get 'customers/show'
  # resources :customers, only: [:show]
  # devise_for :customers
  # devise_for :admins

  get '/' => 'homes#top', as: 'root'
  get '/admin', to:'admin/homes#top'
  get '/customers/mypage', to: 'customers#show'
  get '/customers/check', to: 'customers#check'
  patch '/customers/:id/quit' => 'customers#quit', as: 'quit'
  resources :customers, only: [:edit, :update]
  resources :addresses, only: [:index, :edit, :new, :create, :update, :destroy, :update]
  delete '/addresses/:id/delete' => 'addresses#delete', as:'address_delete'
  resources :items, only: [:index, :show, :create]
  resources :cart_items do
    collection do
    delete 'destroy_all'
  end
  end
  resources :orders, only: [:new, :create, :index, :show] do
    collection do
      get 'thanks'
      post 'check'
    end
  end


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

  get 'home/about' => 'homes#about', as:'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
     resources :genres, only: [:new, :index, :create, :edit, :update]
     resources :items
     resources :customers
     resources :orders
  end

end

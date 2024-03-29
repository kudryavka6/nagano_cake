Rails.application.routes.draw do
  scope module: :public do
   root to: "homes#top"
   get 'home/about' => 'homes#about', as: 'about'
   get 'customers/my_page' => 'customers#show'
   get 'customers/edit' => 'customers#edit'
   get 'customers/unsubscribe' => 'customers#unsubscribe'
   get 'orders/thanks' => 'orders#thanks'
   post 'orders/confirm' => 'orders#confirm'
   patch 'customers/withdraw' => 'customers#withdraw'
   delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
   resources :items, only: [:index, :show]
   resources :customers, only: [:update,]
   resources :cart_items, only: [:index, :update, :destroy, :create]
   resources :orders, only: [:new, :index, :create, :show]
   resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  end
  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
   get '/' => 'homes#top'
   resources :items
   resources :genres, only: [:index, :create,  :edit, :update]
   resources :customers, only: [:index, :show,  :edit, :update]
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]
  end
end

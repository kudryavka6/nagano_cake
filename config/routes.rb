Rails.application.routes.draw do
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
   resources :oders, only: [:show, :update]
   resources :oder_details, only: [:update]
  end
  scope module: :public do
   root to: "homes#top"
   get 'home/about' => 'homes#about', as: 'about'
   resources :items, only: [:index, :show]
   resources :customers, only: [:show, :edit, :update,]
   resources :cart_items, only: [:index, :update, :destroy, :create]
   resources :orders, only: [:new, :index, :create, :cr]
   resources :addresses, only: [:index, :show, :create, :update, :destroy]
  end
end

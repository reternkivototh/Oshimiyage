Rails.application.routes.draw do
  root to: "public/homes#top"
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    passwords: 'public/passwords',
    sessions: 'public/sessions'
  }
  namespace :public do
    get 'homes/about'
    get '/post_images/search' => 'searches#search'
    get '/post_images/search_place' => 'post_images#search_place', as: 'search_place'
    get '/post_images/search_tag' => 'post_images#search_tag', as: 'search_tag'
    resources :post_images, only: [:index, :new, :edit, :update, :create, :destroy, :show] do
      resource :bookmarks, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update]
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    devise_scope :user do
    post 'users/guest_sign_in', to: 'sessions#guest_sign_in'
    end
  end


  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :tags, only: [:index, :edit, :create, :destroy, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :post_images, only: [:index, :show, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root to: "public/homes#top"
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  namespace :public do
    get 'homes/about'
    resources :post_images, only: [:index, :new, :edit]
    devise_scope :user do
      post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
    end
    resources :users, only: [:show, :edit, :update]
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  end


  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :tags, only: [:index, :edit]
    resources :users, only: [:index, :show, :edit]
    resources :post_images, only: [:index, :edit]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

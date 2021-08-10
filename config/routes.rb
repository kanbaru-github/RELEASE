Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }

  namespace :admin do
    resources :posts, only: [:index, :destroy]
    resources :categories, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }

  scope module: :public do
    root 'homes#top'
    get "homes/about" => "homes#about"
    resources :posts
    resources :customers, only: [:show, :edit, :update] do
      get "search", to: "customers#search"
      resource :mutes, only: [:create, :destroy]
      get 'followings', to: 'relationships#followings', as: 'followings'
      get 'followers', to:  'relationships#followers', as: 'followers'
    end
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    put 'customers/withdraw' => 'customers#withdraw'
  end

end



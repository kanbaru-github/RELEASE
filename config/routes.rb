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
    resources :posts do
      resource :sympathies, only: [:create, :destroy]
      resource :cheers, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update] do
      get "search", to: "customers#search"
      resource :relationships, only: [:create, :destroy]
      get 'mutings', to: 'relationships#mutings', as: 'mutings'
      get 'muters', to:  'relationships#muters', as: 'muters'
    end
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    put 'customers/withdraw' => 'customers#withdraw'
    resources :contacts, only: [:new, :create]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'thanks', to: 'contacts#thanks', as: 'thanks'

  end

end



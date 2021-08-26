Rails.application.routes.draw do

  # 多言語化
  # scope "(:locale)", locale: /en|ja/ do
    # get '/:locale' => 'static_pages#home'

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }
  namespace :admin do
    root 'homes#top'
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
    get 'posts/search', to: 'posts#search', as: 'post_search'
    resources :posts do
      resource :sympathies, only: [:create, :destroy]
      resource :cheers, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'mutings', to: 'relationships#mutings', as: 'mutings'
      get 'muters', to:  'relationships#muters', as: 'muters'
      get 'unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
      patch 'withdraw' => 'customers#withdraw', as: 'withdraw_customer'
      put 'withdraw' => 'customers#withdraw'
    end
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    resources :notifications, only: :index
    resources :contacts, only: [:new, :create]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'thanks', to: 'contacts#thanks', as: 'thanks'
  end

# end

end

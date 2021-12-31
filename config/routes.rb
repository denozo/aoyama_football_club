Rails.application.routes.draw do

  get 'events/index'
  get 'events/show'
  #サイト閲覧者
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :members, only:[:index, :show]
  resources :informations, only:[:index, :show]
  resources :game_results, only:[:index, :show]
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
      delete 'destroyall'
    end
  end
  resources :orders, only:[:new, :create] do
    collection do
      post :confirm
      get :thanks
    end
  end
  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
      get :complete
    end
  end


  #管理者
  namespace :admins do
    root to: 'homes#top'
    resources :categories, only:[:index, :create, :edit, :update]
    resources :members
    resources :graduates
    resources :game_results
    resources :informations
    resources :events
    resources :items
    resources :information_for_guardians
    resources :guardians, only:[:index, :show, :edit, :update, :destroy]
    resources :contacts, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :edit, :update]
  end

  #保護者
  namespace :guardians do
    root to: 'homes#show'
    resources :homes, only:[:edit, :update]
    resources :information_for_guardians, only:[:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end
  end

  devise_for :admins
  devise_for :guardians

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
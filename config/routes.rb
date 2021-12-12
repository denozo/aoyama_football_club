Rails.application.routes.draw do

  namespace :admins do
    get 'events/index'
    get 'events/new'
    get 'events/create'
    get 'events/show'
    get 'events/edit'
    get 'events/destroy'
  end
  namespace :admins do
    root to: 'homes#top'
    resources :categories, only:[:index, :create, :edit, :update]
    resources :members, only:[:index, :new, :create, :show, :edit, :update, :destroy]
    resources :graduates, only:[:index, :new, :create, :show, :edit, :update, :destroy]
    resources :game_results, only:[:index, :new, :create, :show, :edit, :update, :destroy]
    resources :informations, only:[:index, :new, :create, :show, :edit, :update, :destroy]
  end

  devise_for :admins
  devise_for :guardians

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
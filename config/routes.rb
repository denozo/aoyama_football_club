Rails.application.routes.draw do

  namespace :admins do
    root to: 'homes#top'
    resources :categories, only:[:index, :create, :edit, :update]
    resources :members, only:[:index, :new, :create, :show, :edit, :update, :destroy]
    resources :graduates, only:[:index, :new, :create, :show, :edit, :update, :destroy]
  end

  devise_for :admins
  devise_for :guardians

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
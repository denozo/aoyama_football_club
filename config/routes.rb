Rails.application.routes.draw do


  namespace :admins do
    resources :categories, only:[:index, :create, :edit, :update]
    root to: 'homes#top'
  end

  devise_for :admins
  devise_for :guardians

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
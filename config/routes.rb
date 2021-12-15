Rails.application.routes.draw do

  namespace :admins do
    root to: 'homes#top'
    resources :categories, only:[:index, :create, :edit, :update]
    resources :members
    resources :graduates
    resources :game_results
    resources :informations
    resources :events
    resources :items
  end
  
  namespace :guardians do
  end

  devise_for :admins
  devise_for :guardians

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
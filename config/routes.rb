Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
  
  devise_for :guardians, controllers: {
    sessions: "guardians/sessions",
    passwords: "guardians/passwords",
    registrations: "guardians/registrations"
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

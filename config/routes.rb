Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  resources :roles
  resources :users

  get 'roles/:role_id/users/new', to: 'users#new', as: 'new_user_role'
end

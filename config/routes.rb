Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  resources :roles
  resources :users
  resources :conference_rooms

  get 'roles/:role_id/users/new', to: 'users#new', as: 'new_user_role'
  get "users/:user_id/conference_rooms/new", to: "conference_rooms#new", as: "new_user_role_room"
end

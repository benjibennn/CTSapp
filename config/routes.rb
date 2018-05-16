Rails.application.routes.draw do
  resources :teachers
  resources :users, controller: "users", only: [:create, :edit, :update, :destroy] do
  end


  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

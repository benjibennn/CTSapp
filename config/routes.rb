Rails.application.routes.draw do
  resources :users, controller: "users", only: [:create, :edit, :update, :destroy] do
  	 member do 
        get 'list_teacher'
        get 'create_teacher'
        get 'list_client'
    end
  end


  root 'users#index'
end

Rails.application.routes.draw do

	resources :students
  resources :teachers


  resources :subjects, :except => [:new] do
  end

  resources :users, controller: "users", only: [:create, :edit, :update, :destroy] do
  	 member do 
        get 'list_teacher'
        get 'create_teacher'
        get 'list_client'
    end
  end



  root 'users#index'
  get 'user/list_teacher' => 'users#list_teacher'
  get 'student/:id/new' => 'students#new'
  get 'user/list_student' => 'users#list_student'
  get 'subjects/:id/new' => 'subjects#new'


end

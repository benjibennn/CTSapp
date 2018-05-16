Rails.application.routes.draw do
<<<<<<< HEAD
	resources :students
  	resources :users, controller: "users", only: [:create, :edit, :update, :destroy] do
	  	 member do 
	        get 'create_teacher'
	        get 'list_client'
	    end
  	end

  get 'user/list_teacher' => 'users#list_teacher'
  get 'student/:id/new' => 'students#new'
  get 'user/list_student' => 'users#list_student'
=======

  resources :subjects
  resources :teachers
  resources :users, controller: "users", only: [:create, :edit, :update, :destroy] do
  	 member do 
        get 'list_teacher'
        get 'create_teacher'
        get 'list_client'
    end
  end


>>>>>>> 67421d12ce7d34503cc5ebe6effaafade3b2cca6
  root 'users#index'

end

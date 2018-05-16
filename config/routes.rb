Rails.application.routes.draw do
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
  root 'users#index'

end

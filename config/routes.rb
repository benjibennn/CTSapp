Rails.application.routes.draw do
  resources :grades
  resources :events
	resources :students
  resources :teachers
  
  resources :classes, :except => [:new, :create] do
  end


  resources :subjects, :except => [:new] do
  end

  resources :users, controller: "users", only: [:create, :edit, :update, :destroy] do
  	 member do 
        get 'list_teacher'
        get 'create_teacher'
        get 'list_client'
        get 'create_client'
    end
  end


  root 'users#index'
  get 'user/list_teacher' => 'users#list_teacher'
  get 'student/:id/new' => 'students#new'
  get 'students/:id/show'=> 'students#show'
  get 'user/list_student' => 'users#list_student'
  get 'subjects/:id/new' => 'subjects#new'
  get 'attend/:classes_id/new' => "attend#new"
  get "attend/:classes_id/:id" => "attend#update"
  get 'classes/:subject_id/new' => 'classes#new'
  get 'classes/:id/show' => 'classes#show'
  post 'classes/create' => 'classes#create'
  get 'classes/:id/show' => 'classes#show'
  delete 'classes/:id' => 'classes#destroy'
  get 'user/list_client' => 'users#list_client'
  get 'students/:id/destroy' => 'students#destroy'



  get 'students/:id/calendar' => 'students#calendar'
  get 'grades/:id/new' => 'grades#new'
  post 'grades/:id/new' => 'grades#create'
  get 'users/list' => 'users#list'

end

Rails.application.routes.draw do
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
    end
  end



  root 'users#index'
  get 'user/list_teacher' => 'users#list_teacher'
  get 'student/:id/new' => 'students#new'
  get 'students/:id/show'=> 'students#show'
  get 'user/list_student' => 'users#list_student'
  get 'subjects/:id/new' => 'subjects#new'
  get 'attend/:id/new' => "attend#new"
  get "attend/:id" => "attend#update"
  get 'classes/:subject_id/new' => 'classes#new'
  post 'classes/create' => 'classes#create'
  get 'students/:id/calendar' => 'students#calendar'
end

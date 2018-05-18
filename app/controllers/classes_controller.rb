class ClassesController < ApplicationController


  def index
  	@classroom = Subject.all.order(:subject_name)
  	@student = Student.all.order(:first_name)
  end

  def show
    @subject = Subject.find(params[:id])
    @classes = Classes.where(subject_id: params[:id])
    @student = Student.all


    # testing for grades
    @class = Classes.all.order(:student_id)
    @sub = Subject.all
    @grade = Grade.all
    @student = Student.all
  end

  def new
  	@classes = Classes.new
  	@student = Student.all.order(:first_name)

  end

  def create
  	
  	@classes = Classes.new(user_id: current_user.id,student_id: params[:classes][:student_id], subject_id: params[:subject_id])
  	 	if @classes.save
  	 		redirect_to '/classes' , notice: 'Classes was successfully created.'
      else
           render :new
      end
  end


end

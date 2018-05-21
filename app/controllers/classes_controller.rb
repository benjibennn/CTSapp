class ClassesController < ApplicationController


  def index
  	@classroom = Subject.all.order(:subject_name)
  	@student = Student.all.order(:first_name)
  end

  def show
<<<<<<< HEAD
  	@classroom = Subject.all.order(:subject_name)
    @student = Classes.where(subject_id: params[:id]).student_id
    @student = Student.all.order(:first_name)
=======
  	@classroom = Subject.find(params[:id])
    @classes = Classes.where(subject_id: params[:id])
    @student = Student.all
>>>>>>> 6c013063e0742ae7d6356a7c7ec3a8ec194da454
  end

  def new
  	@classes = Classes.new
  	@student = Student.all.order(:first_name)

  end

  def create
  	
  	@classes = Classes.new(user_id: current_user.id,student_id: params[:classes][:student_id], subject_id: params[:subject_id])
  	 	if @classes.save
  	 		redirect_to '/classes' , notice: 'Class was successfully created.'
      else
        render :new
      end
  end

  def destroy
    @student = Classes.all
    @student.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to classes_url, notice: 'Student was successfully deregistered.' }
      format.json { head :no_content }
    end
  end

end


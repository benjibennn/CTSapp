class ClassesController < ApplicationController


  def index
  	@classroom = Subject.all.order(:subject_name)
  	@student = Student.all.order(:first_name)
  end

  def show
  	@subject = Subject.find(params[:id])
    @classes = Classes.where(subject_id: params[:id])
    @student = Student.all
    @grade = Grade.all
  end

  def new
  	@classes = Classes.new
  	@student = Student.all.order(:first_name)

  end

  def create
  	
  	@classes = Classes.new(student_id: params[:classes][:student_id], subject_id: params[:subject_id])
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


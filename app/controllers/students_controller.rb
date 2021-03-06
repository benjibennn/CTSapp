class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @client = User.where(id: params[:id])
    @student = Student.where(user_id: params[:id])
  end

  def calendar
    @student = Student.find(params[:id])
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def attendance
  end

  def collection
  end

  def payment
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    # two checks, because admin and teacher are both using this function.
    # so admin should redirect to show teacher and teacher should redirect to show student.
    if current_user.admin?
      respond_to do |format|
      @student.user_id = params[:user_id].to_i
        if @student.save
          format.html { redirect_to '/user/list_client' , notice: 'Student was successfully assigned.' }
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    elsif current_user.teacher?
      respond_to do |format|
      @student.user_id = params[:user_id].to_i

        if @student.save
          format.html { redirect_to '/user/list_student' , notice: 'Student was successfully assigned.' }
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    respond_to do |format|
      format.html { redirect_to list_client_user_path, notice: 'Student profile was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name,:last_name,:phone,:gender,:avatar, :user_id)
    end
end

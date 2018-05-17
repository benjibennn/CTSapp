class StudentsController < ApplicationController


  def index
  
  end


  def show
  end


  def new
    @student = Student.new
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
          format.html { redirect_to '/user/list_teacher' , notice: 'Student was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    elsif current_user.teacher?
      respond_to do |format|
      @student.user_id = params[:user_id].to_i

        if @student.save
          format.html { redirect_to '/user/list_student' , notice: 'Student was successfully created.' }
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
        format.html { redirect_to @student, notice: 'student was successfully updated.' }
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
      format.html { redirect_to student_url, notice: 'student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name,:last_name,:phone,:gender, :avatar, :user_id)
    end
end

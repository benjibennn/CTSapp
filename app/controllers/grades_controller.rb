class GradesController < ApplicationController
<<<<<<< HEAD
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  # GET /grades.json
  def index
    @subject = Subject.all
    @grades = Grade.all
    @grades.each do |grade|
      p grade.classes.student.first_name
      p grade.classes.subject.subject_name
    end
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new


  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade=Grade.new(grade_params)

      if @grade.save
        redirect_to @grade, notice: 'Grade was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:scores, :classes_id)
    end
end
=======

    def new
        @event = Event.new
    end

    def create
        @grade = Grade.new(grades_params)
             if @grade.save
                redirect_to "/classes/#{params[:subject_id]}/show", notice: 'Student was successfully graded.'
            else
                render :new
            end
    end

    def grades_params
        params.permit(:classes_id, :scores)
      end
end
>>>>>>> 6c013063e0742ae7d6356a7c7ec3a8ec194da454

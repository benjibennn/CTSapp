class GradesController < ApplicationController

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
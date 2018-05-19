class AttendController < ApplicationController

    def new
        @subject = Subject.find(params[:classes_id])
        @classes = Classes.where(subject_id: params[:classes_id])
        @student = Student.all
        @attend = Attend.all
    end


# attendance not complete, unable to link subject_id
    def update
            @subject = Subject.all
            @classes = Classes.all
            @student = Student.find_by(id: params[:id])
            @attendance = Attend.new
            if @attendance.present != true
                @attendance.present = true
                @attendance.student_id = params[:id] 
                @attendance.date = Date.today
                @attendance.classes_id = params[:classes_id]
                @attendance.save
                redirect_back(fallback_location: root_path)
        end
    end
end
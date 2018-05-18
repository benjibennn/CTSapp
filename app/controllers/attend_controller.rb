class AttendController < ApplicationController

    def new
        @classes = Classes.all
        @student = Student.all
        @subject = Subject.all
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
                @attendance.subject_id = params[:subjectid]
                @attendance.save
            return redirect_to root_path, notice: "true."
        end
    end
end
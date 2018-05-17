class ClassesController < ApplicationController
  Classes.joins(:subject).joins(:student)

  def index
  	@classroom = Subject.all.order(:subject_name)
  	@student = Student.all.order(:first_name)
  end

  def show
  	@classroom = Subject.all
  end
end
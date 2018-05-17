class ClassesController < ApplicationController

  def index
  	@classroom = Subject.all.order(:subject_name)
  	@student = Student.all.order(:first_name)
  end

  def show
  	@classroom = Subject.all.order(:subject_name)
  end
end
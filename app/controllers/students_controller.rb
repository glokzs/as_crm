class StudentsController < ApplicationController
  before_action :authenticate_user!, :is_student?

  def show
    @student = Student.find(params[:id])
  end

  private
  def is_student?
    redirect_to root_path if current_user.role != 2
  end

end

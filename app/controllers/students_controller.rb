class StudentsController < ApplicationController
  before_action :authenticate_user!, :is_student?

  def show
    @student = Student.find(params[:id])
    redirect_to admin_users_path
  end

  private
  def is_student?
    redirect_to root_path if current_user.role != 2
  end
  def student_params
    params.require(:student).permit(:last_name, :first_name, :middle_name, :iin, :email, :tel_1, :tel_2, :telegram, :gender, :id_card, :date_of_issue, :issued_by, :group_id, :avatar, images: [])
  end
end

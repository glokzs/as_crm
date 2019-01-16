class Admin::StudentsController < Admin::AdminController

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = 'Студент успешно добавлен'
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  private
  def student_params
    params.require(:student).permit(:last_name, :first_name, :middle_name, :iin, :email, :tel_1, :tel_2, :skype, :gender, :id_card, :date_of_issue, :issued_by, :group_id, :course_id)
  end
end

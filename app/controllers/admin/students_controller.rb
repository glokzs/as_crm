class Admin::StudentsController < Admin::AdminController

  def index
    @students = Student.all
  end

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
      redirect_to admin_students_path 
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
    
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to admin_student_path
    else
      render 'edit'
    end
  end

  def destroy
    Student.destroy(params[:id])
    redirect_to admin_users_path
  end

 
  private
  def student_params
    params.require(:student).permit(:last_name, :first_name, :middle_name, :iin, :email, :tel_1, :tel_2, :telegram, :gender, :id_card, :date_of_issue, :issued_by, :group_id, :avatar, images: [])
  end
  
end

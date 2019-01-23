class Admin::TeachersController < Admin::AdminController

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    @groups = @teacher.groups
  end

  def new
    @teacher = Teacher.new
  end

  def create
     @teacher = Teacher.new(teacher_params)
    if  @teacher.save
      flash[:notice] = 'Преподователь успешно добавлен'
      redirect_to admin_teachers_path
    else
      render 'new'
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to admin_teacher_path(@teacher)
    else
      render 'edit'
    end
  end

  def destroy
    Teacher.destroy(params[:id])

    redirect_to admin_users_path
  end

  private
  def teacher_params
    params.require(:teacher).permit(:last_name, :first_name, :middle_name, :email, :tel_1, :tel_2, :telegram, :picture )
  end
end




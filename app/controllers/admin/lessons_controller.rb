class Admin::LessonsController < Admin::AdminController
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to admin_lessons_path
    else
      render 'new'
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to admin_lessons_path
    else
      render 'edit'
    end
  end

  def destroy
    Lesson.destroy(params[:id])

    redirect_to admin_lessons_path
  end

  def lesson_params
    params.require(:lesson).permit(:theme_id, :date, :group_id)
  end
end

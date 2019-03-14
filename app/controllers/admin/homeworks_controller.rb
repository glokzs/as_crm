# frozen_string_literal: true

class Admin::HomeworksController < Admin::AdminController
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @homeworks = Homework.where(lesson_id: @lesson.id)
    @group = @lesson.group
    @student = Student.where(lesson_id: @lesson.id)
    @students = @group.students
    @students_who_not_sended = @students - send_homework_method
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @homework = Homework.new
  end

  def create
    @homework = Homework.new(homework_params)

    if @homework.save
      redirect_to admin_homeworks_path
    else
      render 'new'
    end
  end

  def edit
    @homework = Homework.find(params[:id])
  end

  def update
    @homework = Homework.find(params[:id])
    if @homework.update(homework_params)
      redirect_to admin_homeworks_path
    else
      render 'edit'
    end
  end

  def destroy
    Homework.destroy(params[:id])

    redirect_to admin_homeworks_path
  end
  private

  def send_homework_method
    @send_homework = []
    @lesson.homeworks.each do |homework| 
    @send_homework << homework.student    
    end
    @send_homework
  end

  def homework_params
    params.require(:homework).permit(:lesson_id, :date, :homework_file, :student_id)
  end
end

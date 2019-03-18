# frozen_string_literal: true

class Admin::CoursesController < Admin::AdminController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to admin_courses_path
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to admin_courses_path
    else
      render 'edit'
    end
  end

  def destroy
    Course.destroy(params[:id])

    redirect_to admin_courses_path
  end

  def course_params
    params.require(:course).permit(:name)
  end
end

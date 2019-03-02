# frozen_string_literal: true

class TeachersController < ApplicationController
  before_action :authenticate_user!, :is_teacher?

  def show
    @teacher = Teacher.find(params[:id])
    @group = Group.find(params[:id])
    @themes = @group.course.themes
    @lessons = @group.lessons
    @homeworks = Homework.all
    @student = Student.find(params[:id])
    @students = @group.students
    @groups = @teacher.groups
  end

  def show_profile_teacher
    @teacher = Teacher.find(params[:id])
  end 

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to teacher_path
    else
      render 'edit'
    end
  end

  private

  def is_teacher?
    redirect_to root_path if current_user.role != 3
  end

  def teacher_params
    params.require(:teacher).permit(:last_name, :first_name, :middle_name, :email, :tel_1, :tel_2, :telegram, :avatar, images: [])
  end
end

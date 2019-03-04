# frozen_string_literal: true
class GroupsController < ApplicationController

  before_action :authenticate_user!

  def show
    @group = Group.find(params[:id])
    @students = @group.students
    @themes = @group.course.themes
    @lessons = @group.lessons
    @student = Student.find(params[:id])
    @homeworks = Homework.all
  end

  def group_params
    params.require(:group).permit(:name, :course_id, :start, :end)
  end
end

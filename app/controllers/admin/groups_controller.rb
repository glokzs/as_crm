# frozen_string_literal: true

class Admin::GroupsController < Admin::AdminController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @students = @group.students
    @themes = @group.themes
    @lessons = @group.lessons
    @lesson = Lesson.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to admin_groups_path
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to admin_groups_path
    else
      render 'edit'
    end
  end

  def destroy
    Group.destroy(params[:id])

    redirect_to admin_groups_path
  end

  def group_params
    params.require(:group).permit(:name, :course_id, :start, :end)
  end
end

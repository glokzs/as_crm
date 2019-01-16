class Admin::GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
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

  def update
    @group = Group.find(params[:id])
  end


  def destroy
    Group.destroy(params[:id])

    redirect_to admin_groups_path
  end

  def group_params
    params.require(:group).permit(:name, :course_id, :created_at, :updated_at)
  end

end

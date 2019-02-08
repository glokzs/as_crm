class GroupsController < ApplicationController
  # before_action :authenticate_user!

  def show
    @group = Group.find(params[:id])
  end
  
  def group_params
    params.require(:group).permit(:name, :course_id, :start, :end)
  end
end

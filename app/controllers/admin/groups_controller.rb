class Admin::GroupsController < Admin::AdminController
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
    if @group.update(group_params)
  redirect_to admin_path
else
  render 'edit'
end
  end


  def destroy
    Group.destroy(params[:id])

    redirect_to admin_groups_path
  end

  def group_params
    params.require(:group).permit(:name)
  end

end

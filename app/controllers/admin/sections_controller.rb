class Admin::SectionsController < Admin::AdminController
  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    @section[:template_id] = 1
    if @section.save
      redirect_to admin_template_path(1)
    else
      render 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
    @templates = Template.all
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      redirect_to admin_template_path(1)
    else
      render 'new'
    end
  end

  private
  def section_params
    params.require(:section).permit(:title, :number, :template_id)
  end
end

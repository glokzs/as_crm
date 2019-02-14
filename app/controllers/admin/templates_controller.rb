# frozen_string_literal: true

class Admin::TemplatesController < Admin::AdminController
  def index
    @templates = Template.all
  end

  def new
    @template = Template.new
  end

  def show
    @template = Template.find(params[:id])
  end

  def create
    @template = Template.new(template_params)
    if @template.save
      redirect_to admin_templates_path
    else
      render 'new'
    end
  end

  def edit
    @template = Template.find(params[:id])
  end

  def update
    @template = Template.find(params[:id])
    if @template.update(template_params)
      redirect_to @template
    else
      render 'new'
    end
  end

  private

  def template_params
    params.require(:template).permit(:title)
  end
end

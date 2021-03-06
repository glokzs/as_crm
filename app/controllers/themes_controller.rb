# frozen_string_literal: true

class ThemesController < ApplicationController
  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find(params[:id])
    @student = current_user
  end

  def new
    @theme = Theme.new
    @courses = Course.all
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to admin_themes_path
    else
      render 'new'
    end
  end

  def edit
    @theme = Theme.find(params[:id])
    @courses = Course.all
  end

  def update
    @theme = Theme.find(params[:id])
    if @theme.update(theme_params)
      redirect_to admin_themes_path
    else
      render 'new'
    end
  end

  private

  def theme_params
    params.require(:theme).permit(:number, :title, :addition, :course_id, :content)
  end
end

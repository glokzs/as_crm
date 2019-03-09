# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!

  def show
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name)
  end
end

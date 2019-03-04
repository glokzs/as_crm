# frozen_string_literal: true

class HomeworksController < ApplicationController
  def index
    @homeworks = Homework.all
  end

  def show
    @homework = Homework.find(params[:id])
  end

  def new
    @homework = Homework.new
  end

  def create
    @homework = Homework.new(homework_params)

    if @homework.save
      redirect_back fallback_location: root_path
    else
      render 'new'
    end
  end

  def edit
    @homework = Homework.find(params[:id])
  end

  def destroy
    Homework.destroy(params[:id])

    redirect_to homeworks_path
  end

  def homework_params
    params.require(:homework).permit(:lesson_id, :date, :homework_file, :student_id)
  end
end

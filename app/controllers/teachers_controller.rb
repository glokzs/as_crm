# frozen_string_literal: true

class TeachersController < ApplicationController
  before_action :authenticate_user!, :is_teacher?

  def show
    @teacher = Teacher.find(params[:id])
  end

  private

  def is_teacher?
    redirect_to root_path if current_user.role != 3
  end

  def teacher_params
    params.require(:teacher).permit(:last_name, :first_name, :middle_name, :email, :tel_1, :tel_2, :telegram, :picture)
  end
end

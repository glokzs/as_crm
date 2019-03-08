# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    if current_user.role == 1
      admin_users_url

    elsif current_user.role == 2 && Student.find_by(email: current_user.email)
      student_url(current_user)
    elsif current_user.role == 3
      teacher = Teacher.find_by(email: current_user.email)
      teacher_path(teacher.id)

    else
      root_url
    end
  end
end

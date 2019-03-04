# frozen_string_literal: true

class Admin::UsersController < Admin::AdminController
  def index
    @users = User.all
    @students = Student.all

    @teachers = Teacher.all

  end
end

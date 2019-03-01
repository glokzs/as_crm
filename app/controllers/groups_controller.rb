# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!

  def show
    @group = Group.find(params[:id])
  end
end

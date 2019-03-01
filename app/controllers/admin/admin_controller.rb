# frozen_string_literal: true

class Admin::AdminController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  layout 'admin'

  private

  def is_admin?
    redirect_to root_path if current_user.role != 1
  end
end

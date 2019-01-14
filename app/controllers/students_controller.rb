class StudentsController < ApplicationController
	before_action :set_student
	
	def show
		@student = Student.find(params[:id])
	end

	def set_student
		if user_signed_in? && current_user.role == 2
			student_url(current_user)
		else 
			redirect_to root_url
		end
	end
end
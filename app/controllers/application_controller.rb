class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
		if current_user.role == 1
			return admin_url
		elsif current_user.role == 2 && Student.find_by(email: current_user.email)
			return student_url(current_user)
		else
			return root_url
		end
	end
end

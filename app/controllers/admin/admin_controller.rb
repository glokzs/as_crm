class Admin::AdminController < ApplicationController
	before_action :set_admin
	layout 'admin'
	def set_admin
		if user_signed_in? && current_user.role == 1
			admin_users_url(current_user)
		else 
			redirect_to root_url
		end
	end
end

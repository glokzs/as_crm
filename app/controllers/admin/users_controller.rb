class Admin::UsersController < Admin::AdminController
	def index
		@users = User.all
    @students = Student.all
	end

end

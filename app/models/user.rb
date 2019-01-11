class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable, :trackable,
         :recoverable, :rememberable, :validatable
	
	after_create :set_role
	def set_role
		user = User.last
		user.role = 2 if Student.find_by(email: user.email)
		user.save
	end
end

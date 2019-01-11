class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	validates :name, presence: true, length: { maximum: 50 }
	
	after_create :set_role
	def set_role
		user = User.last
		user.role = 2 if Student.find_by(email: user.email)
		user.save
	end
end

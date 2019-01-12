class User < ApplicationRecord
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable, :trackable,
<<<<<<< HEAD
  :recoverable, :rememberable, :validatable
  #на данный момент не реализована модель Student
  after_create :set_role
  def set_role
  	user = User.last
	# user.role = 2 if Student.find_by(email: user.email)
	user.save
	end
=======
         :recoverable, :rememberable, :validatable


         has_one :student, foreign_key: :email
>>>>>>> ticket-5
end

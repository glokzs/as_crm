class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :timeoutable, :trackable,
  :recoverable, :rememberable, :validatable

  has_one :student, foreign_key: :email
  
  after_create :set_role
  
  def set_role
    user = User.last
    user.role = 2 if Student.find_by(email: user.email)
    user.save
  end
end

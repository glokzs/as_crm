class Student < ApplicationRecord
	has_one :user, foreign_key: :email
  has_one :contract
  has_one_attached :avatar
  has_many_attached :images
  belongs_to :group


  after_create :create_user

  enum gender: {male: 1, female: 2}

  private
  def create_user
    student = Student.last
    user = User.create!(email: student.email, role: 2)
  end
end

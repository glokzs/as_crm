class Student < ApplicationRecord
	has_one :user, foreign_key: :email
  has_one :contract
  belongs_to :group

  has_one_attached :avatar

  has_and_belongs_to_many :lessons


  after_create :create_user

  enum gender: {male: 1, female: 2}
  has_many_attached :images
  private
  def create_user
    student = Student.last
    user = User.create!(email: student.email, role: 2)
  end
end


  
  


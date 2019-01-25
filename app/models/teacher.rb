class Teacher < ApplicationRecord
  has_one :user, foreign_key: :email
  has_and_belongs_to_many :groups
  has_one_attached :avatar
  
  after_create :create_user


  private
  def create_user
    teacher = Teacher.last
    user = User.create!(email: teacher.email, role: 3)
  end
end

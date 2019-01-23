class Teacher < ApplicationRecord
  has_one :user, foreign_key: :email
  belongs_to :group
  has_one_attached :picture
  
  after_create :create_user


  private
  def create_user
    teacher = Teacher.last
    user = User.create!(email: teacher.email, role: 3)
  end
end

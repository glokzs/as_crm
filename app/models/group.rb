class Group < ApplicationRecord
  belongs_to :course
  has_many :students
  has_and_belongs_to_many :teachers
  has_many :lessons
  has_many :themes
end

class Homework < ApplicationRecord
  belongs_to :lesson
  belongs_to :student
  has_one_attached :homework_file
end

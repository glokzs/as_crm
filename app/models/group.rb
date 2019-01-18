class Group < ApplicationRecord
	belongs_to :courses
	has_many :students
end

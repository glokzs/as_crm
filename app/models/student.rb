class Student < ApplicationRecord
	has_one :user, foreign_key: :email
	has_many_attached :pictures
end

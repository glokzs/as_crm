class Student < ApplicationRecord
	has_one :user, foreign_key: :email
end

# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :groups
  has_many :themes

  validates :name, presence: true,
                    length: { minimum: 3, maximum: 100 }
end

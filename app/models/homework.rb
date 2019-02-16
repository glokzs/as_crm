# frozen_string_literal: true

class Homework < ApplicationRecord
  belongs_to :lesson
  belongs_to :student
  has_one_attached :homework_file
  has_one :rewiew
end

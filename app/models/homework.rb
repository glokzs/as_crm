# frozen_string_literal: true

class Homework < ApplicationRecord
  belongs_to :lesson
  belongs_to :student
end

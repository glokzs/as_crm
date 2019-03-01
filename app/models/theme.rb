# frozen_string_literal: true

class Theme < ApplicationRecord
  belongs_to :course
  has_many :lessons
end

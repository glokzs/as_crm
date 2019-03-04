# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :theme
  belongs_to :group
  has_and_belongs_to_many :students
  has_many :homeworks
  has_many :reviews
end

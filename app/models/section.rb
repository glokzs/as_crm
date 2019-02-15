# frozen_string_literal: true

class Section < ApplicationRecord
  belongs_to :template
  has_many :clauses, dependent: :destroy
end

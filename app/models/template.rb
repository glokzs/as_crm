# frozen_string_literal: true

class Template < ApplicationRecord
  has_many :sections, dependent: :destroy
end

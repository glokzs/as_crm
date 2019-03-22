# frozen_string_literal: true

class Theme < ApplicationRecord
  belongs_to :group
  has_many :lessons

  validates :title, presence: true,
                    length: { maximum: 100 }
  validates :content, presence: true,
                    length: { maximum: 4000 }
end

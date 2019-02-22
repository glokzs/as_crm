# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :homework
  belongs_to :lesson

end

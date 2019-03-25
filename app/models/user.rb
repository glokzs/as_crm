# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :timeoutable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :student, foreign_key: :email
  has_one :teacher, foreign_key: :email

  before_validation { self.email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  protected

  def password_required?
    confirmed? ? super : false
  end

  def password_match?
    errors[:password] << 'must be provided' if password.blank?
    errors[:password] << 'and confirmation do not match' if password != password_confirmation
    (password == password_confirmation) && !password.blank?
  end
end

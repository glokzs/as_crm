# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :timeoutable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :student, foreign_key: :email
  has_one :teacher, foreign_key: :email

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

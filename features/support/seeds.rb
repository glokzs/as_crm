# frozen_string_literal: true

admin = User.new(
  email: 'admin@admin.com',
  password: '123456',
  role: 1
)
admin.skip_confirmation!
admin.save



admin = User.new(
          email: 'admin@admin',
					password: '123456',
					role: 1)
admin.skip_confirmation!
admin.save
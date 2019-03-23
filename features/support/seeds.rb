# frozen_string_literal: true

admin = User.new(
  email: 'admin@admin',
  password: '123456',
  role: 1
)
admin.skip_confirmation!
admin.save


Course.create!(name: 'Разработчик Ruby on Rails')
Course.create!(name: 'Разработчик Javascript')
Course.create!(name: 'Разработчик  Python')
Course.create!(name: 'Разработчик Java')

Group.create(name: 'RoR-1', course_id: 1, start: '12/02/2018', end: '05/02/2019')
Group.create(name: 'RoR-2', course_id: 1, start: '12/02/2018', end: '05/02/2019')
Group.create(name: 'Javscr-1', course_id: 2, start: '12/12/2018', end: '05/12/2019')
Group.create(name: 'Javscr-2', course_id: 2, start: '12/02/2019', end: '05/02/2020')
Group.create(name: 'Pyt-1', course_id: 3, start: '11/05/2018', end: '04/05/2019')
Group.create(name: 'Jav-1', course_id: 4, start: '11/01/2019', end: '04/02/2020')


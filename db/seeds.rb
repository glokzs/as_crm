# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.new(
          email: 'admin@admin',
					password: '123456',
					role: 1)
admin.skip_confirmation!
admin.save

Course.create!(name: 'Разработчик Ruby on Rails')
Group.create(name: 'RoR-1', course_id: 1, start: '12/02/2018', end: '05/02/2019')
Template.create!(title: 'об оказании услуг по обучению')

student_1 = Student.create!(
  first_name: 'Пушкин',
 last_name: 'Александр',
  middle_name: 'Сергеевич',
  iin: 123654789632,
  tel_1: '87775556666',
  tel_2: '87779996622',
  email: 'student@student',
  skype: 'ivanov222',
  gender: 0,
  id_card: '3698521478',
  date_of_issue: '12/01/2015',
  issued_by: 'МВД РК',
  group_id: 1,
  course_id: 1)

student_2 = Student.create!(
  first_name: 'Лермонтов',
 last_name: 'Михаил',
  middle_name: 'Юрьевич',
  iin: 123654789632,
  tel_1: '87775556666',
  tel_2: '87779996622',
  email: 'lermontov@gmail',
  skype: 'ivanov222',
  gender: 0,
  id_card: '3698521478',
  date_of_issue: '12/01/2015',
  issued_by: 'МЮ РК',
  group_id: 1,
  course_id: 1)

# frozen_string_literal: true

# Допустим('залогинен пользователь с email {string} и паролем {string}') do |email, password|
#   visit('/')
#   within('#new_user') do
#     fill_in('Email', with: email)
#     fill_in('Password', with: password)
#     sleep(3)
#     click_button('Войти')
#     sleep(1)
#   end
#   expect(page).to have_xpath('//h2')
# end

# Если("он создаёт студента с данными: имя {string} email {string}") do |first_name, email|
#   visit("admin/students/new")
#   within('#new_student') do
#     fill_in('Имя', with: first_name)
#     sleep(1)

#     fill_in('Email', with: email)
#     sleep(3)
#     select('Pyt-1',from:'group_id')
#     sleep(3)
#     click_button('Создать')
#     sleep(3)

#   end
# end

# То("студента Иван видно в списке студентов") do
#   visit("admin/students")
#   find('td', text: 'Иван', match: :prefer_exact)
# end


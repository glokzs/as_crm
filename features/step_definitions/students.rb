# frozen_string_literal: true

Допустим('залогинен пользователь с email {string} и паролем {string}') do |email, password|
  visit('/')
  within('#new_user') do
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    sleep(3)
    click_button('Войти')
    sleep(1)
  end
  expect(page).to have_xpath('//h2')
end

# То('он может создать студента с данными:') do |_table|
#   visit('/admin/students/new') do
#     # find('#new_student')
#     within('#new_student') do
#       fill_in('Фамилия', with: Одинокий)
#       fill_in('Имя', with: Голубь)
#       # fill_in('Email', with: table.hashes[0][:Email])
#       # select(table.hashes[0][:Группа], from: 'Группа')
#     end
#     click_button('Создать')
#   end
#   expect(page).to have_content('Голубь')
# end

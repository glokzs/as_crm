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

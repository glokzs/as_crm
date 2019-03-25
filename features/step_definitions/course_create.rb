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

Если("он создаёт курс с данными: название {string}") do |name|
  visit("/admin/courses/new")
  within('#new_course') do
    fill_in('Название', with: name)
    sleep(1)
    click_button('Создать')
    sleep(3)
  end
end

То("курс Разработчики RoR видно в списке курсов") do
  visit("/admin/courses")
  find('td', text: 'Разработчики RoR', match: :prefer_exact)
end
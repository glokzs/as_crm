Если("он создаёт преподавателя с данными: имя {string} фамилия {string} email {string}") do |first_name, last_name, email|
  visit("/admin/teachers/new")
  within('#new_teacher') do
    fill_in('Имя', with: first_name)
    sleep(1)
    fill_in('Фамилия', with: last_name)
    sleep(1)
    fill_in('Email', with: email)
    fill_in('Тел', with: "77071235689")

    click_button('Создать')
    sleep(2)
  end
end
  
То("преподавателя Виктор Александрович видно в списке преподавателей") do
  visit("/admin/teachers")
  sleep(2)
  find('td', text: 'Виктор')
end
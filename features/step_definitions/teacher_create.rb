Если("он создаёт преподавателя с данными: имя {string} фамилия {string} email {string}") do |first_name, last_name, email|
    visit("/admin/teachers/new")
    within('#new_teacher') do
      fill_in('Имя', with: first_name)
      sleep(1)
      fill_in('Фамилия', with: last_name)
      sleep(1)
      fill_in('Email', with: email)
  
      click_button('Создать')
      sleep(2)
    end
  end
  
  То("преподавателя Виктор Александрович видно в списке преподавателей") do
    visit("/admin/teachers")
    find('td', text: 'v.aleksandrovich@mail.ru', match: :prefer_exact)
  end
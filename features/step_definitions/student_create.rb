Если("он создаёт студента с данными: имя {string} email {string}") do |first_name, email|
    visit("admin/students/new")
    within('#new_student') do
      fill_in('Имя', with: first_name)
      sleep(3)
      fill_in('Email', with: email)

      select('RoR-2', from:'Группа')
      sleep(1)
      click_button('Создать')
      sleep(3)
    end
  end
  
  То("студента Иван видно в списке студентов") do
    visit("admin/students")
    find('td', text: 'Иван', match: :prefer_exact)
  end
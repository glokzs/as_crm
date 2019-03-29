Если("он создаёт занятие с данными: название {string}") do |string|
  visit("/admin/lessons/new")
  within('#new_lesson') do
    select('ООП', from:'Тема занятия')
    
    select('RoR-1', from:'Группа')
    
    fill_in('Дата дедлайна', with: '2019-03-05'  )
    
    click_button('Создать')
    sleep(3)
  end
end

Если("Раздаточный материал домашки {string}") do |string|
 
end

То("занятие ООП видно в списке занятий") do
  visit("/admin/lessons")
  find('td', text: 'ООП', match: :prefer_exact)
  sleep(3)
end

Если("он создаёт тему с данными: название {string}") do |string|
  visit("/admin/themes/new")
  within('#new_theme') do
    fill_in('Название', with: 'ООП')
    
    select('Разработчик Ruby on Rails', from:'Курс')
    
    select('RoR-1', from:'Группа')
   
    click_button('Создать')
    sleep(3)
  end
end

То("тему ООП видно в списке тем") do
  visit("/admin/themes")
  find('td', text: 'ООП', match: :prefer_exact)
  sleep(3)
end
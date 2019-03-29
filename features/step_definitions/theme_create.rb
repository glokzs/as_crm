Если("он создаёт тему с данными: название {string}") do |string|
  visit("/admin/themes/new")
  within('#new_theme') do
    fill_in('Название', with: 'ООП')
    sleep(3)
    select('Разработчик Ruby on Rails', from:'Курс')
    sleep(3)
    select('RoR-1', from:'Группа')
    sleep(7)
    click_button('Создать')
    sleep(3)
  end
end

То("тему ООП видно в списке тем") do
  visit("/admin/themes")
  find('td', text: 'ООП', match: :prefer_exact)
  sleep(3)
end
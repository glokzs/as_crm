Если("он создаёт тему с данными: название {string}") do |title|
  visit("/admin/themes/new")
  within('#new_theme') do
    fill_in('Название', with: title)
    sleep(3)

    select('Разработчик Ruby on Rails', from:'Курс')
    sleep(3)
    select('RoR-1', from:'Группа')
    sleep(3)
    click_button('Создать')
    sleep(3)
  end
end

То("тему Массивы, обьекты, события видно в списке тем") do
  visit("/admin/themes")
  find('td', text: 'Массивы, обьекты, события', match: :prefer_exact)
  sleep(3)
end
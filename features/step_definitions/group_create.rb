Если("он создаёт группу с данными: название {string}") do |name|
  visit("groups/new")
  within('#new_group') do
    fill_in('Название', with: name)
    sleep(3)

    select('Разработчик Ruby on Rails', from:'Курс')
    sleep(1)
    click_button('Создать')
    sleep(3)
  end
end

То("группу RoR-1 видно в списке групп") do
  visit("groups")
  find('td', text: 'RoR-1', match: :prefer_exact)
  sleep(3)
end
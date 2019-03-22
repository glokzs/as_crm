  Если("он создаёт группу с данными: название {string}") do |name|
    visit("admin/groups/new")
    within('#new_group') do
      fill_in('Название', with: name)
      select('RoR', from:'course_id')
      sleep(1)
      click_button('Создать')
      sleep(3)
    end
  end
  
  То("группа RoR-1 видно в списке групп") do
    visit("admin/groups")
    find('td', text: 'RoR-1', match: :prefer_exact)
  end
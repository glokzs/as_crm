 Если("он создаёт занятие с данными: название {integer}") do |theme_id|
   visit("/admin/lessons/new")
   within('#new_lesson') do
     select('Массивы, обьекты, события', from:'Тема занятия')
     sleep(3)
     select('RoR-1', from:'Группа')
     sleep(3)
     fill_in('Раздаточный материал домашки', with: homework_task)
     sleep(7)
     click_button('Создать')
     sleep(3)
   end
 end

  To("занятие Массивы, обьекты, события видно в списке тем") do
   visit("/admin/lessons")
   find('td', text: 'Массивы, обьекты, события', match: :prefer_exact)
   sleep(3)
 end
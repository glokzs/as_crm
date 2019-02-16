Допустим("залогинен пользователь с email {string} и паролем {string}") do |email, password|
 visit('/')
 within('#new_user') do
   fill_in('Email', with: email)
   fill_in('Password', with: password)
   sleep(3)
   click_button('Войти')
   sleep(1)
 end
 expect(page).to have_xpath("//h2")
end

То("он может создать студента с данными:") do |table|
   visit('/admin/students/new') do
    find('#new_student')
     within(:xpath, "//*[@id='new_student']") do
     fill_in('Фамилия', with: hash[:Фамилия])
     fill_in('Имя', with: hash[:Имя])
     fill_in('Email', with: hash[:Email])
     select(hash[:Группа], from: 'Группа')
   end
     click_button('Создать')
  end
 expect(page).to have_content('Голубь Одинокий')

end



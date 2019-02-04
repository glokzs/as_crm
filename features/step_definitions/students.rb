Допустим("залогинен пользователь с email {string} и паролем {string}") do |email, password|
 visit('/')
 within('#new_user') do
   fill_in('Email', with: email)
   fill_in('Password', with: password)
   sleep(2)
 end
   click_button('Войти')
   sleep(5)
end

То("он может создать студента с данными:") do |table|
   visit('/admin/students/new') do
     within('#new_student') do
     fill_in('Фамилия', with: table.hashes[0][:Фамилия])
     fill_in('Имя', with: table.hashes[0][:Имя])
   end
     click_button('Создать')
  end
end



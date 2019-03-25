Если("он меняет имя студента с {string} на {string}") do |current_first_name, new_first_name|
  student_id = find_student(current_first_name).id
  visit("students/#{student_id}/edit")
  within('#new_student') do 
    fill_in('student_first_name', with: new_first_name)
    sleep(2)
    fill_in('student_email', with: "petr@student.com")
    sleep(2)
    click_button('Изменить')
  end 
end

То("студента Петр видно в списке студентов") do
  sleep 2
  visit("admin/students")
  sleep(2)
  find('td', text: 'Петр', match: :first)
  sleep 2
end

def find_student(first_name)
  Student.find_by(first_name: "#{first_name}")
end

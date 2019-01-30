class CreateTableLessonsStudents < ActiveRecord::Migration[5.2]
	def change
		create_table :lessons_students, id: false do |t|
			t.belongs_to :lesson, index: true
			t.belongs_to :student, index: true
		end
	end
end

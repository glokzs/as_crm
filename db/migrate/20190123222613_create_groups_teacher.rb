class CreateGroupsTeacher < ActiveRecord::Migration[5.2]
  def change
    create_table :groups_teachers, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :teacher, index: true
    end
  end
end

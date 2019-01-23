class CreateTeachersAndGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers_groups, id: false do |t|
     t.belongs_to :teacher, index: true
     t.belongs_to :group, index: true
   end
 end
end

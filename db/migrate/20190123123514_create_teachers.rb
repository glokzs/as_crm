class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :tel_1
      t.string :tel_2
      t.string :email
      t.string :telegram
      t.integer :group_id

      t.timestamps
    end
  end
end

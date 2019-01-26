class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :theme_id
      t.date :date
      t.integer :group_id

      t.timestamps
    end
  end
end

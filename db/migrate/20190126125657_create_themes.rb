class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.integer :number
      t.string :title
      t.string :addition
      t.integer :course_id

      t.timestamps
    end
  end
end

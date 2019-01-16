class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :course_id
      t.date :date_began
      t.date :expiration_date

      t.timestamps
    end
  end
end

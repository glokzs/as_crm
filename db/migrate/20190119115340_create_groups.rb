# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :course_id
      t.string :name
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end

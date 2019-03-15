# frozen_string_literal: true

class CreateHomeworks < ActiveRecord::Migration[5.2]
  def change
    create_table :homeworks do |t|
      t.integer :lesson_id
      t.date :date
      t.integer :student_id
      t.boolean :status, default: true

      t.timestamps
    end
  end
end

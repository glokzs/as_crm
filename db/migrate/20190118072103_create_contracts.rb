# frozen_string_literal: true

class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.date :date, default: Date.today
      t.string :number
      t.integer :student_id, index: true

      t.timestamps
    end
  end
end

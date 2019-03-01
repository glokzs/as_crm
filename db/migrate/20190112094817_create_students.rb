# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :iin
      t.string :tel_1
      t.string :tel_2
      t.string :email
      t.string :telegram
      t.integer :gender
      t.string :id_card
      t.date :date_of_issue
      t.string :issued_by
      t.integer :group_id

      t.timestamps
    end
  end
end

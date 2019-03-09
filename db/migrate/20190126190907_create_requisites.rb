# frozen_string_literal: true

class CreateRequisites < ActiveRecord::Migration[5.2]
  def change
    create_table :requisites do |t|
      t.string :owner
      t.string :address
      t.string :bin, limit: 12
      t.string :bank
      t.string :iik
      t.string :bik
      t.string :email
      t.string :web
      t.string :tel_1
      t.string :tel_2
      t.string :tel_3
      t.string :function
      t.string :fio
      t.string :based
      t.string :function_2
      t.string :fio_2

      t.timestamps
    end
  end
end

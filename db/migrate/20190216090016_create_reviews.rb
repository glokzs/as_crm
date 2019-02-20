# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :homework_id
      t.date :date
      t.decimal :rate

      t.timestamps
    end
  end
end

class CreateClauses < ActiveRecord::Migration[5.2]
  def change
    create_table :clauses do |t|
      t.integer :section_id
      t.decimal :number
      t.text :body

      t.timestamps
    end
  end
end

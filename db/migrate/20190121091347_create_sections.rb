class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.integer :template_id
      t.integer :number
      t.string :title

      t.timestamps
    end
  end
end

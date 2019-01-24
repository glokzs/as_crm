class ChangeNumberInClauses < ActiveRecord::Migration[5.2]
  def change
    change_table :clauses do | t |
      t.change :number, :string
    end
  end
end

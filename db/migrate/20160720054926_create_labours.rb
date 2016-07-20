class CreateLabours < ActiveRecord::Migration[5.0]
  def change
    create_table :labours do |t|
      t.string :employee_id
      t.string :name

      t.timestamps
    end
  end
end

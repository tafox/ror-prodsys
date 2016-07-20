class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.datetime :start
      t.datetime :end
      t.integer :labour_id
      t.integer :machine_id

      t.timestamps
    end
  end
end

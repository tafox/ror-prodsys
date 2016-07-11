class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.datetime :start
      t.datetime :finish
      t.integer :machine
      t.integer :labour

      t.timestamps
    end
  end
end

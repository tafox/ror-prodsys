class CreateLabourAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :labour_availabilities do |t|
      t.string :labour_id
      t.integer :day
      t.integer :month
      t.integer :schedule_id
      t.boolean :utilized, default:false

      t.timestamps
    end
  end
end

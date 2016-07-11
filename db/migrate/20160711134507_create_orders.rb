class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :schedule
      t.integer :status
      t.string :notes

      t.timestamps
    end
  end
end

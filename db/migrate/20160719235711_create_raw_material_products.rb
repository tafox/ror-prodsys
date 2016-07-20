class CreateRawMaterialProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :raw_material_products do |t|
      t.integer :product_id
      t.integer :rawmaterial_id
      t.integer :quantity

      t.timestamps
    end
  end
end

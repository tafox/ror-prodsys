# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(name: '#2 Pencil', time:8)
Product.create(name: 'Black Pen', time:8)
Product.create(name: 'Fancy Pen', time:8)
Product.create(name: 'Gold Pen', time:8)
Product.create(name: 'Silver Pen', time:8)

RawMaterialProduct.create(product_id:1, rawmaterial_id:1, quantity:10)
RawMaterialProduct.create(product_id:2, rawmaterial_id:1, quantity:10)
RawMaterialProduct.create(product_id:2, rawmaterial_id:2, quantity:4)
RawMaterialProduct.create(product_id:3, rawmaterial_id:1, quantity:10)
RawMaterialProduct.create(product_id:3, rawmaterial_id:3, quantity:5)
RawMaterialProduct.create(product_id:4, rawmaterial_id:1, quantity:10)
RawMaterialProduct.create(product_id:4, rawmaterial_id:3, quantity:2)
RawMaterialProduct.create(product_id:5, rawmaterial_id:2, quantity:10)
RawMaterialProduct.create(product_id:5, rawmaterial_id:3, quantity:3)

Labour.create(name: 'Bill')
Labour.create(name: 'John')
Labour.create(name: 'Tim')
Labour.create(name: 'Joey')
Labour.create(name: 'Craig')

for i in 1..5
	Machine.create
end

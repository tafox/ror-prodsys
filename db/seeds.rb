# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(name: '#2 Pencil', stock: 100, time:30)
Product.create(name: 'Black Pen', stock: 50, time:20)
Product.create(name: 'Fancy Pen', stock: 10, time:120)
Product.create(name: 'Gold Pen', stock: 15, time:300)
Product.create(name: 'Silver Pen', stock: 20, time:200)

Labour.create(name: 'Bill')
Labour.create(name: 'John')
Labour.create(name: 'Tim')
Labour.create(name: 'Joey')
Labour.create(name: 'Craig')

for i in 1..5
	Machine.create
end
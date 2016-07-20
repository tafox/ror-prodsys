class Schedule < ApplicationRecord
	def self.getSchedule(product_id, quantity)
		product = Product.find(product_id)
		time = (product[:time].to_i * quantity.to_i) + 30
		lastSchedule = Schedule.order("created_at").last
		if lastSchedule.blank?
			start = DateTime.new(2016, 07, 12, 20, 10, 0)
			id = 1
		else
			start = lastSchedule[:finish]
			id = lastSchedule[:id] + 1
		end
		finish = start
		labour = Labour.assignLabour(id)
		machine = Machine.assignMachine(id)
		schedule = Schedule.new(start: start, end: finish, machine_id: machine, labour_id: labour)
		schedule.save
		return id
	end
	def self.lastId
		lastSchedule = Schedule.order("created_at").last
		if lastSchedule.blank?
			start = DateTime.new(2016, 07, 12, 20, 10, 0)
			id = 1
		else
			start = lastSchedule[:finish]
			id = lastSchedule[:id] + 1
		end
		return id
	end
end

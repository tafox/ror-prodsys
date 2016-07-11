class Schedule < ApplicationRecord
	def self.getSchedule(product_id, quantity)
		product = Product.find(product_id)
		time = (product[:time].to_i * quantity.to_i) + 30
		lastSchedule = Schedule.order("created_at").last
		if lastSchedule.blank?
			start = DateTime.new(2016, 07, 12, 20, 10, 0)
			id = 1
		else
			start = lastSchedule[:finish] + 30.minutes
			id = lastSchedule[:id] + 1
		end
		finish = start + time.minutes
		labour = Labour.assignLabour(id)
		machine = Machine.assignMachine(id)
		schedule = Schedule.new(start: start, finish: finish, machine: machine, labour: labour)
		schedule.save
		return id
	end
end
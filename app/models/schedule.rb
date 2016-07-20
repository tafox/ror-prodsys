class Schedule < ApplicationRecord
	def self.getSchedule(product_id, quantity)
		product = Product.find(product_id)
		available_labour = LabourAvailability.order(month: :asc, day: :asc).limit((quantity/200).ceil.to_i)
		avallable_labour.each do |l|
			l.update(utilized: true)
		end		

		start = DateTime.new(2016, available_labour.first.month, available_labour.first.day, 9, 0, 0)
		finish = DateTime.new(2016, available_labour.last.month, available_labour.last.day, 17, 0, 0)
		
		lastSchedule = Schedule.order("created_at").last
		if lastSchedule.blank?
			start = DateTime.new(2016, 07, 21, 0, 0, 0)
			id = 1
		else
			start = lastSchedule[:finish]
			id = lastSchedule[:id] + 1
		end
		machine = Machine.assignMachine(id)
		labour = Labour.assignLabour(id)		

		schedule = Schedule.new(start: start, end: finish, machine_id: machine, labour_id: labour)
		schedule.save
		return id
	end

	def self.lastId
		lastSchedule = Schedule.order("created_at").last
		if lastSchedule.blank?
			id = 1
		else
			id = lastSchedule[:id] + 1
		end
		return id
	end
end

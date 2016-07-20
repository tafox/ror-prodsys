class Machine < ApplicationRecord
	def self.assignMachine(schedule_id)
		if schedule_id == 1
			return 1
		else 
			schedule = Schedule.find(schedule_id-1)
		end
		if schedule[:machine] == 5
			id = 1
		else
			id = schedule[:machine]
		end
		return id
	end
end

class Labour < ApplicationRecord
	def self.assignLabour(schedule_id)
		if schedule_id == 1
			return 1
		else
			schedule = Schedule.find(schedule_id-1)
		end
		if schedule[:labour] == 5
			id = 1
		else
			id = schedule[:labour] + 1
		end
		return id
	end
end

class Order < ApplicationRecord
	def self.newOrder params
		schedule_id = Schedule.getSchedule(params[:order][:product_id], params[:order][:quantity])
		order = {
			product_id: params[:order][:product_id],
			quantity: params[:order][:quantity],
			schedule: schedule_id,
			status: 0,
			notes: params[:order][:notes]
		}
		@order = Order.new(order)
		@order.save
		return @order
	end

	def show
		@order = Order.find(params[:id])
	end
end

require 'open-uri'

class Order < ApplicationRecord
	def self.newOrder params
		schedule_id = Schedule.lastId
		product_id = params[:order][:product_id];
		quantity = params[:order][:quantity];
		order = {
			product_id: product_id,
			quantity: quantity,
			schedule: schedule_id,
			status: 0,
			notes: params[:order][:notes]
		}

		begin
			RawMaterialProduct.where(product_id: product_id).each do |r|
				amount = r.quantity.to_i * quantity.to_i
				response = open('http://scmgroup.azurewebsites.net/api/ip/inventory/procurement_order?product_id=' + r.rawmaterial_id.to_s + '&quantity=' + amount.to_s).read
			end

                        if Labour.all.size == 0
                                response = open('http://cs490-hr-2016.appspot.com/hrms/payroll').read
                                employees = JSON.parse(response);
                                employees.each do |e|
                                        labour = {
                                                id: e.employee_id,
						name: e.name
                                        }
					@labour = Labour.new(labour)
					@labour.save
                                end
                        end

                        rescue OpenURI::HTTPError => ex
				puts 'http error'
                end


		Schedule.getSchedule(params[:order][:product_id], params[:order][:quantity])
		
		@order = Order.new(order)
		@order.save
		return @order
	end

	def show
		@order = Order.find(params[:id])
	end
end

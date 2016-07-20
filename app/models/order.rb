require 'open-uri'
require 'net/http'

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
			baseUri = 'http://scmgroup.azurewebsites.net/api/inventory'
			RawMaterialProduct.where(product_id: product_id).each do |r|
				amount = r.quantity.to_i * quantity.to_i
				response = open(baseUri + '/raw_materials/' + r.rawmaterial_id.to_s).read
				response.delete! '\\'
				response[0] = ''
				resp2 = response.chomp('"')
				remaining_mats = JSON.parse(resp2)
				amount -= remaining_mats[0]["Units"].to_i + remaining_mats[0]["Inbound Units"].to_i

				header = {
					'Content-Type' =>'application/json'
				}
				toSend = {
					'raw_material_id' => r.rawmaterial_id,
					'destination_site_id' => 1,
					'buy_amount' => amount
				}.to_json
				uri = URI.parse(baseUri + '/new_procurement_order')	
				http = Net::HTTP.new(uri.host, uri.port)
				request = Net::HTTP::Post.new(uri.request_uri, header)
				request.body = toSend
				response = http.request(request)
				puts response.body

				#product_id=' + r.rawmaterial_id.to_s + '&quantity=' + amount.to_s).read
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
				puts ex.io.string
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

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

			mockdata = ['20161001108', '20161001109', '20161001110', '20161001111']
			baseUri = 'https://cs490-hr-2016.appspot.com/_ah/api/hrms/v1'
	                
			if Labour.all.size == 0
                                #response = open('/payroll').read
                                #employees = JSON.parse(response);
                                
				#employees.each do |e|
                                #        labour = {
                                #                id: e.employee_id,
                                #        }
				#	@labour = Labour.new(labour)
				#	@labour.save
                                #end
				
				mockdata.each do |e|
					labour = { id: e }
					@labour = Labour.new(labour)
					@labour.save
				end
                        end

			month = LabourAvailability.order(month:).last.month;
			if LabourAvailability.where(:utilized = false).size <= 20
				Labour.all.each do |e|
					uri = URI.parse(baseUri + '/employeeStatus/' + e.employee_id + '20160/' + (month + 1).to_s)
					header = {
						'Content-Type' =>'application/json'
					}
					http = Net::HTTP.new(uri.host, uri.port)
					http.use_ssl = true;
					
					request = Net::HTTP::Post.new(uri.request_uri, header)
					request.body = toSend
					response = http.request(request)

					days = response.body["availableDates"]
					days.each do |day|
						labour_availability = {
							month: 7,
							day: day.to_i
							employee_id: e.employee_id
						}
						@labour_availability = LabourAvailability.new(labour_availability)
						@labour_availability.save
					end
					
					puts response.body
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

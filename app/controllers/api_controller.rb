require 'json'

class ApiController < ApplicationController
	def create
		params[:order] = params
		puts params
		@order = Order.newOrder(params)
		respond_to do |format|
			format.json do
				render :json => {:schedule_id => @order.schedule}.to_json
			end
			format.html { redirect_to(@order) }
		end
	end
	def view
		respond_to do |format|
			@order = Order.find(params[:schedule_id])
			@schedule = Schedule.find(@order.schedule)
			@status = @order.status
			@status_string = 'unknown'
			case @status
				when 0
					@status_string = 'queued'
				when 1
					@status_string = 'in progress'
				when 2
					@status_string = 'completed'
			end
			format.json do
				render :json => {:schedule_id => @order.schedule, :expected_end_date => @schedule.end, :status => @status_string}.to_json
			end 
			format.html { redirect_to(@order) }
		end
	end
end

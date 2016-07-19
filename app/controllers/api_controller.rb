require 'json'

class ApiController < ApplicationController
	def create
		params[:order] = params
		puts params
		@order = Order.newOrder(params)
		redirect_to @order
	end
	def view
		respond_to do |format|
			@order = Order.find(params[:id])
			format.json { render json: @order.to_json, status: :ok }
			format.html
		end
	end
end

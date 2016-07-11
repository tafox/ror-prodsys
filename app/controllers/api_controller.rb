class ApiController < ApplicationController
	def create
		params[:order] = params
		puts params
		@order = Order.newOrder(params)
		redirect_to @order
	end
end

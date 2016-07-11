class ApiController < ApplicationController
	def createOrder
		url = request.original_url
		uri = URI.parse(url)
		order = CGI.parse(uri.query)
		params[:order] = order
		@order = Order.newOrder(params)
		redirect_to orders_show_url
	end

	def show
		redirect_to controller: "orders", action: "show", id: @order.id
	end
end

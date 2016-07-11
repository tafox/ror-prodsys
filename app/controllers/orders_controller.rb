class OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def new
	end

	def edit
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	order = {
			status: params[:order][:status],
			notes: params[:order][:notes]
		}
	  @order.update(order)
	  redirect_to @order
	end
	 
	def create
		@order = Order.newOrder(params)
		redirect_to @order
	end

	def show
		@order = Order.find(params[:id])
	end
end

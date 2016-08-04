class OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@menu = @order.menu
	end

	def new
		@order = Order.new
	end

	def create
  	@order = Order.new(order_params)
	  if @order.save
	  	redirect_to @order
		else
			render 'new'
		end
	end

	private
	  def order_params
<<<<<<< HEAD
	    params.require(:order).permit(:menu_id,:user_id)
=======
	    params.require(:order).permit(:user_id,:menu_id)
>>>>>>> a869527c7acbf4dd4d4f550737f6acaa8f30218a
	  end
end
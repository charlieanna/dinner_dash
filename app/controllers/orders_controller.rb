class OrdersController < ApplicationController
	def new
		if @cart.line_items.empty?
      redirect_to root_path, notice: "Your cart is empty"
      return
    end
    @order = Order.new
	end

	def create
    @order = Order.create(order_params)
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderNotifier.received(@order).deliver
        format.html { redirect_to root_path, notice:
          'Thank you for your order.' }
        format.json { render action: 'show', status: :created,
          location: @order }

      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors,
          status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
  	params.require(:order).permit(:name, :address, :pay_type, :email)
  end

end

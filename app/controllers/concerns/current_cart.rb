module CurrentCart
	extend ActiveSupport::Concern

	private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id], user: session[:user_id]) || Cart.find_by(id: session[:cart_id])
    unless @cart
      @cart = Cart.create
    end
    session[:cart_id] = @cart.id
  end
end

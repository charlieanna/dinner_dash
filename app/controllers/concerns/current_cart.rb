module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    @cart = Cart.find_or_initialize_by(id: session[:cart_id])
    @cart.user_id = session[:user_id] if session[:user_id]
    if @cart.new_record?
      @cart.save!
      session[:cart_id] = @cart.id
    end
   end
end

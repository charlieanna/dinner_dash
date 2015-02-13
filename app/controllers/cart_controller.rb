class CartController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end
end

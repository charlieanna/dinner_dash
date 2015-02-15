class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  def create
  	order = Order.find(params[:invoice])
  	order.update_attributes(status: 'paid')
  	PaymentNotification.create!(:params => params, :cart_id => @cart.id, :status => params[:payment_status], :transaction_id => params[:txn_id] )
    render :nothing => true
  end
end
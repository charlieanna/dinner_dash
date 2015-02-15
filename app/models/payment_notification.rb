class PaymentNotification < ActiveRecord::Base
  belongs_to :cart
  serialize :params
  after_create :mark_order_as_purchased
  
private
  def mark_order_as_purchased
    if status == "Completed"
      cart.update_attributes(:purchased_at => Time.now)
    end
  end
end
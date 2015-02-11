class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  STATUS_TYPES = ["completed", "ordered", "cancelled", "paid"]
  has_many :line_items, dependent: :destroy
  belongs_to :user
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_amount
    sum = 0
    line_items.each do |line_item| 
      sum += line_item.quantity
    end
    sum
  end
end
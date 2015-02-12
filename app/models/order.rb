class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  STATUS_TYPES = ["completed", "ordered", "cancelled", "paid"]
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
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

 #  def paypal_url(return_url)
 #    values = {
 #    :business => 'xxxxxxxx@xxx.com',
 #        :cmd => '_cart',
 #    :upload => 1,
 #    :return => return_url,
 #    }   values.merge!({
 #    "amount_1" => unit_price,
 #    "item_name_1" => name,
 #    "item_number_1" => id,
 #    "quantity_1" => '1'
 #    })
 #         # For test transactions use this URL
 #    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
 # end
end

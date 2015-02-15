class Order < ActiveRecord::Base
  PAYMENT_TYPES = ['Check', 'Credit card', 'Purchase order']
  STATUS_TYPES = %w(completed ordered cancelled paid)
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

  def paypal_url(return_url, notify_url)
    values = {
      :business => 'jainadi57@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :notify_url => notify_url,
      :invoice => id
    }
    line_items.each_with_index do |line_item, index|
    values.merge!({
      "amount_#{index+1}" => line_item.item.price,
      "item_name_#{index+1}" => line_item.item.title,
      "item_number_#{index+1}" => line_item.id,
      "quantity_#{index+1}" => line_item.quantity
    })
  end  
    # For test transactions use this URL
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
 
end

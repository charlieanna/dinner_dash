class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def total_price
    line_items.to_a.sum(&:total_price)
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
    values.merge!({
      "amount_1" => 100,
      "item_name_1" => "name",
      "item_number_1" => 1,
      "quantity_1" => '1'
    })
    # For test transactions use this URL
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end

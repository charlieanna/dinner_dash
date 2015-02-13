class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def total_price
    line_items.to_a.sum(&:total_price)
  end
end

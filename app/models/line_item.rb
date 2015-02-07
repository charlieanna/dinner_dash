class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart
  delegate :title, to: :item
end

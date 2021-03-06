class Item < ActiveRecord::Base
  include PgSearch
  belongs_to :sale
  pg_search_scope :search_by_full_text, against: [:title, :description]
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than: 0
  has_and_belongs_to_many :categories
  validates :categories, presence: true
  accepts_nested_attributes_for :categories
  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  has_many :reviews

  def price_after_discount
    price - (price*sale.discount)/100
  end
end

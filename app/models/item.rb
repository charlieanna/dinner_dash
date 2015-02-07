class Item < ActiveRecord::Base
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates_numericality_of :price, greater_than: 0
	belongs_to :category
end

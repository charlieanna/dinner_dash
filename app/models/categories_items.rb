class CategoriesItems < ActiveRecord::Base
  belongs_to :category
  belongs_to :item
end

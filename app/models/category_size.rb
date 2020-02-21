class CategorySize < ApplicationRecord
  belongs_to :category
  belongs_to :items_size
end

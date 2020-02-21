class Category < ApplicationRecord
 has_many :items
 has_many :category_sizes
 has_many :items_sizes, through: :category_sizes
 has_ancestry
#  validates :category, inclusion: { in: %w(small medium large),
#  message: "%{value}は有効な値ではありません" }, allow_nil: true
 
end
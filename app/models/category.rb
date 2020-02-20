class Category < ApplicationRecord
 has_many :items
 has_ancestry
 validates :category, inclusion: { in: %w(small medium large),
 message: "%{value}は有効な値ではありません" }, allow_nil: true
 
end
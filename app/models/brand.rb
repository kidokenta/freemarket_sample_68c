class Brand < ApplicationRecord
  belongs_to :item 
  validates :brand, inclusion: { in: %w(small medium large),
    message: "%{value}は有効な値ではありません" }, allow_nil: true
end

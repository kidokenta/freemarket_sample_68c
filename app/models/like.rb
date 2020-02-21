class Like < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_many :like_items, through: :likes, source: :item 
end

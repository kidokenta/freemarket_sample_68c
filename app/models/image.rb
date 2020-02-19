class Image < ApplicationRecord
  belongs_to :item,optional: true
  validates :image, presence: true
end

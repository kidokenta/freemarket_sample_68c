class Size < ApplicationRecord
  has_many :items
  has_ancestry
  validates :size, presence: true
end

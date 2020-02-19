class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :explain, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :condition, presence: true
  validates :shipping_fee, presence: true
  validates :shipping_days, presence: true
  validates :shipping_company, presence: true
  validates :shipping_region, presence: true
  validates :price, presence: true, length: { maximum: 6 ,minimum: 3}
  validates :seller_user_id, presence: true


  has_many :comments
  has_many :likes
  has_many :images
  belongs_to :user
  belongs_to :brand
  belongs_to :category
end

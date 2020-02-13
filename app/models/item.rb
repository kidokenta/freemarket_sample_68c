class Item < ApplicationRecord
  validates :item_name, presence: true, length: { maximum: 30 }
  validates :item_explain, presence: true
  validates :status, presence: true
  validates :condition, presence: true
  validates :shipping_fee, presence: true
  validates :shipping_days, presence: true
  validates :shipping_company, presence: true
  validates :region, presence: true
  validates :item_name, presence: true, length: { maximum: 7 }
  validates :seller_user_id, presence: true
end

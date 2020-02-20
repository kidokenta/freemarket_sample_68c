class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :explain, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :condition, presence: true
  validates :shipping_fee, presence: true
  validates :shipping_days, presence: true
  # validates :shipping_company, presence: true
  validates :shipping_region, presence: true
  validates :price, presence: true, length: { maximum: 6 ,minimum: 3}
  validates :seller_user_id, presence: true
  validates :shipping_company, inclusion: { in: %w(small medium large),
    message: "%{value}は有効な値ではありません" }, allow_nil: true
    validates :brand, inclusion: { in: %w(small medium large),
    message: "%{value}は有効な値ではありません" }, allow_nil: true
    validates :category, inclusion: { in: %w(small medium large),
    message: "%{value}は有効な値ではありません" }, allow_nil: true
 



  has_many :comments
  has_many :likes
  has_many :images
  accepts_nested_attributes_for :images
  has_many :user
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end

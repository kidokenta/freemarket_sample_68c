class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :explain, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :condition, presence: true
  validates :shipping_fee, presence: true
  validates :shipping_days, presence: true
  validates :shipping_region, presence: true
  validates :category_id, presence: true
  validates :brand, presence: true, length: { maximum: 15 }
  validates :price, presence: true, length: { maximum: 6 ,minimum: 3}
  validates :category_id, presence: true
  validates :seller_user_id, presence: true
  # validates :brand, inclusion: { in: %w(small medium large),message: "%{value}は有効な値ではありません" }, allow_nil: true


  has_many :comments
  has_many :users
  has_many :likes
  has_many :images, dependent: :destroy
  belongs_to :category ,optional:true

  accepts_nested_attributes_for :images
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :prefecture

end

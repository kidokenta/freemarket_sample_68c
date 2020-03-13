class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :explain, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :condition, presence: true
  validates :shipping_fee, presence: true
  validates :shipping_days, presence: true
  validates :shipping_region, presence: true
  validates :price, presence: true, length: { maximum: 6 ,minimum: 3}
  validates :seller_user_id, presence: true
  validates :category_id, presence: true
  validates :brand, presence: true, length: { maximum: 15 }
  validates :size_id, presence: true
 

  has_many :comments
  has_many :users
  has_many :likes
  has_many :images, dependent: :destroy
  belongs_to :category
  belongs_to :size

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end

  accepts_nested_attributes_for :images, allow_destroy: true
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :prefecture

end

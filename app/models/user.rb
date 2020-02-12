class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 6 }
  validates :famiry_name        , presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name         , presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :famiry_name_kana   , presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana    , presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday           , presence: true
  validates :postal_code        , presence: true, format: { with: /\A\d{7}\z/ }
  validates :adress_prefecture  , presence: true
  validates :adress_town        , presence: true
  validates :adress_number      , presence: true

end

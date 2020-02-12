class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 6 }
  validates :famiry_name        , presence: true
  validates :first_name         , presence: true
  validates :famiry_name_kana   , presence: true
  validates :first_name_kana    , presence: true
  validates :birthday           , presence: true
  validates :postal_code        , presence: true
  validates :adress_prefecture  , presence: true
  validates :adress_town        , presence: true
  validates :adress_number      , presence: true

end

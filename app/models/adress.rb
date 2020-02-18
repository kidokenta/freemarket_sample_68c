class Adress < ApplicationRecord
  belongs_to :user


  validates :postal_code        , presence: true, format: { with: /\A\d{7}\z/ }
  validates :prefecture  , presence: true
  validates :town        , presence: true
  validates :number      , presence: true
end
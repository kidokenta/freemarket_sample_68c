class Country < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    delegate :name, to: :prefecture

    def full_address
        "#{name}#{city}"  
      end
end

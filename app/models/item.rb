class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
      belongs_to :category
      belongs_to :condition
      belongs_to :send_charge
      belongs_to :prefecture
      belongs_to :days_ship
      
      has_one_attached :image
      VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze

      validates :category_id, numericality: { other_than: 1 } 
      validates :condition_id, numericality: { other_than: 1 } 
      validates :send_charge_id, numericality: { other_than: 1 } 
      validates :prefecture_id, numericality: { other_than: 1 } 
      validates :days_ship_id, numericality: { other_than: 1 } 
  validates :image, presence: true
 
  validates :price, numericality: { in: 300..9999999 },format: { with: VALID_PRICE_REGEX }
end

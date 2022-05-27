class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :send_charge
  belongs_to :prefecture
  belongs_to :days_ship
  belongs_to :user
  has_one :order
  has_one_attached :image
  VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, allow_blank: true }
  validates :condition_id, presence: true, numericality: { other_than: 1, allow_blank: true }
  validates :send_charge_id, presence: true, numericality: { other_than: 1, allow_blank: true }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, allow_blank: true }
  validates :days_ship_id, presence: true, numericality: { other_than: 1, allow_blank: true }
  validates :image, presence: true

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: VALID_PRICE_REGEX, allow_blank: true }
end

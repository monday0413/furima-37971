class Order < ApplicationRecord
  belongs_to :send_charge
  belongs_to :item
  belongs_to :user
  has_one :address
end

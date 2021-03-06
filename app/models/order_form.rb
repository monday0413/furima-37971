class OrderForm
  include ActiveModel::Model

  attr_accessor :price, :token, :order, :post_code, :prefecture_id, :city, :address_number,
                :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, allow_blank: true }
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1 }
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city,
                   address_number: address_number, building_name: building_name, phone_number: phone_number)
  end
end

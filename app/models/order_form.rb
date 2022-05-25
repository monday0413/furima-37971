class OrderForm
  include ActiveModel::Model
  
  attr_accessor :price,:token,:order, :post_code, :prefecture_id, :city, :address_number, 
                :building_name,:phone_number, :user_id, :item_id
 
  with_options presence: true do
      validates :order          
      validates :price
     # validates :token         
      validates :post_code,     format: {with: /\A[0-9]{3}-[0-9]{4}\z/ } 
      validates :prefecture_id
      validates :city       
      validates :address_number
      validates :phone_number, format: {with:  /\A\d{10,11}\z/ }   
  end            
 
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
     Address.create(order_id: order_id, post_code: post_code, prefecture_id: prefecture_id, city: city, address_num: address_num, building_name: building_name,address_number: address_number, building_name:building_name, phone_number:phone_number, item_id: item.id )
   end
 
 end





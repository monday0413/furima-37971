FactoryBot.define do
  factory :order_form do
   
    post_code       { '321-0101' }
    prefecture_id   { 2 }
    city            { '市町村' }
    address_number  { '2' }
    building_name   { 'ビル' }
    phone_number    { '09011112222' }

    
  end
end




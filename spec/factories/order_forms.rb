FactoryBot.define do
  factory :order_form do
    price { 3000 }
    token { 'tok_abcdefghijk00000000000000000' }
    post_code       { '321-0101' }
    prefecture_id   { 2 }
    city            { '市町村' }
    address_number  { '2' }
    building_name   { 'ビル' }
    phone_number    { '09011112222' }
    user_id         { 11 }
    item_id         { 11 }
  end
end

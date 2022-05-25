FactoryBot.define do
  factory :order do
    price           { 20000 }
    item_name       { 'おすすめの本' }
    send_charge_id  { 2 }
    post_code       { 321-1234 }
    prefecture_id   { 2 }
    city            { '市町村' }
    address_number  { 2 }
    building_name   { 'ビル' }
    phone_number    { '09011112222' }

    
    association :item
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end




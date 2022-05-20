FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    item_name {Faker::Book.title}
    explanation  {"おすすめの本です"} 
    category_id   {2}
    condition_id  {2}
    send_charge_id {2}
    prefecture_id  {2}
    days_ship_id   {2}
    price          {500}

    association :user 

    after(:build) do |item|        
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end

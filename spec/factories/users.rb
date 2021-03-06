FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { password }
    family_name { person.last.kanji }
    first_name { person.first.kanji }
    family_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birth_day { Faker::Date.backward }
  end
end

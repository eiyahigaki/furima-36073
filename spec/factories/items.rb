FactoryBot.define do
  factory :item do
    title { Faker::Lorem.word }
    detail { Faker::Lorem.sentences }
    category_id { Faker::Number.between(from: 2, to: 11) }
    state_id { Faker::Number.between(from: 2, to: 7) }
    charge_id { Faker::Number.between(from: 2, to: 3) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    term_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/preview.jpeg'), filename: 'preview.jpeg')
    end
  end
end

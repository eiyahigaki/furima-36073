FactoryBot.define do
  factory :history_delivery do
    token       { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    area_id     { Faker::Number.between(from: 2, to: 48) }

    Faker::Config.locale = 'ja'
    city        { Faker::Address.city }
    address     { Faker::Address.street_name }
    building    { Faker::Address.street_address }
    tel         { Faker::Number.leading_zero_number(digits: 11) }
  end
end

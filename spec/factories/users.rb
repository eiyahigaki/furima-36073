FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'a1'+Faker::Internet.password(min_length: 4, mix_case: true) }
    password_confirmation { password }
    en_family   { '田中' }
    en_first    { '陸太郎' }
    kana_family { 'タナカ' }
    kana_first  { 'リクタロウ' }
    birth       { Faker::Date.birthday }
  end
end

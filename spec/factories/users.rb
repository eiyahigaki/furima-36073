FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }

    Faker::Config.locale = 'ja'
    en_family   { Faker::Name.last_name }
    en_first    { Faker::Name.first_name }
    kana_family { 'タナカ' }
    kana_first  { 'リクタロウ' }
    birth       { Faker::Date.birthday }
  end
end

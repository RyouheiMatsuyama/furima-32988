FactoryBot.define do
  factory :user do
    nick_name              { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name              { '山田' }
    first_name             { '太郎' }
    first_name_kana        { 'タロウ' }
    last_name_kana         { 'ヤマダ' }
    birth_date             { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end

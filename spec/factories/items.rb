FactoryBot.define do
  factory :item do
    name                      { Faker::Name.initials(number: 2) } #Faker::Name.initials(number: 2)
    explanation               { Faker::Internet.free_email }
    details_category_id       { 2 }
    details_state_id          { 2 }
    shipping_fee_burden_id    { 2 }
    prefecture_id             { 2 }
    days_to_ship_id           { 2 }
    selling_price             { 5000 }

    association :user
  end

end

FactoryBot.define do
  factory :order_address do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    block { Faker::Address.street_address }
    building { '柳ビル103' }
    phone_number { Faker::Number.decimal_part(digits: 10) }
    token { "tok_abcdefghijk00000000000000000" }
  end
end

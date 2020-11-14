FactoryBot.define do
  factory :item do
    name { 'テスト' }
    price               { 1234 }
    explain_item        { 'この商品はテストです' }
    category_id         { 2 }
    status_id           { 2 }
    delivery_fee_id { 2 }
    place_id            { 2 }
    delivery_date_id    { 2 }
    association :user
  end
end

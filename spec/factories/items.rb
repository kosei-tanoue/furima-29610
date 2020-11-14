FactoryBot.define do
  factory :item do
    name {"テスト"}
    # binding.pry
    price               {1234}
    explain_item        {"この商品はテストです"}
    category_id         {2}
    status_id           {2}
    delivery_fee_id      {2}
    place_id            {2}
    delivery_date_id    {2}
    association :user

    # after(:build) do |item|
    #   item.image.attach(io: File.open("public/images/test_image.png"))
    # end
  end
end
